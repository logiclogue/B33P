let sprite_sheet id =
    match id with
    | _ -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

let actions_to_state (state : GraphicsV1State.t) (action : GraphicsV1.t) : GraphicsV1State.t =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> state
        | SetSpriteSheet sprite_sheet -> set_sprite_sheet sprite_sheet state
        | SetFont font -> set_font font state
        | SetTextColour text_colour -> set_text_colour text_colour state
        | DrawSprite _ -> state
        | DrawText _ -> state
    ))

let action_to_actions (action : GraphicsV1.t) (state : GraphicsV1State.t) : SpriteCanvas.t list =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> [SpriteCanvas.Clear]
        | SetSpriteSheet sprite_sheet -> []
        | SetFont font -> []
        | SetTextColour text_colour -> []
        | DrawSprite (sprite, (x, y)) ->
            [SpriteCanvas.DrawSprite (find_sprite sprite state, x, y)]
        | DrawText (text, (x, y)) ->
            TextToSpriteCanvas.draw_text text x y (get_text_colour state)
    ))

let graphics_v1_obs_to_sprite_obs (graphics_v1_obs : GraphicsV1.t RxJS.observable) : SpriteCanvas.t RxJS.observable =
    let state_obs = graphics_v1_obs
        |> RxJS.scan (fun state action _ ->
            actions_to_state state action
        ) GraphicsV1State.default in

    graphics_v1_obs
        |> RxJS.with_latest_from state_obs
        |> RxJS.map (fun (action, state) -> action_to_actions action state)
        |> RxJS.concat_list

let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list GraphicsV1.[
        Clear;
        SetSpriteSheet sprite_sheet;
        SetFont CharacterSprites.find;
        SetTextColour Colours.white;
        DrawSprite ("character", (50, 30));
        DrawText ("JORDAN", (50, 0));
    ]
        |> graphics_v1_obs_to_sprite_obs
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

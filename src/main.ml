let sprite_sheet id =
    match id with
    | _ -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

let graphics_v1_obs_to_sprite_obs (graphics_v1_obs : GraphicsV1.t RxJS.observable) : SpriteCanvas.t RxJS.observable =
    let action_to_actions = GraphicsV1ToSpriteCanvas.f in
    let actions_to_state = GraphicsV1Reducer.reduce in

    let f (_, old_state) action _ = 
        let state = actions_to_state old_state action in

        (action_to_actions action state, state) in

    graphics_v1_obs
        |> RxJS.scan f ([], GraphicsV1State.default)
        |> RxJS.map (fun (actions, _) -> actions)
        |> RxJS.concat_list

let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list GraphicsV1.[
        Clear;
        SetSpriteSheet sprite_sheet;
        SetFont CharacterSprites.find;
        SetTextColour Colours.white;
        DrawSprite ("character", (50, 30));
        SetTextColour Colours.white;
        DrawText ("JORDAN", (50, 0));
        SetTextColour Colours.blue;
        DrawText ("BLAH", (50, 8));
    ]
        |> graphics_v1_obs_to_sprite_obs
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

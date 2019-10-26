let sprite_sheet id =
    match id with
    | _ -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

let actions_to_state state action =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> state
        | SetSpriteSheet sprite_sheet -> set_sprite_sheet sprite_sheet state
        | SetFont font -> set_font font state
        | DrawSprite _ -> state
        | DrawText _ -> state
    ))

let action_to_actions action state =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> [SpriteCanvas.Clear]
        | SetSpriteSheet sprite_sheet -> []
        | SetFont font -> []
        | DrawSprite (sprite, (x, y)) ->
            [SpriteCanvas.DrawSprite (find_sprite sprite state, x, y)]
        | DrawText (text, (x, y)) ->
            TextToSpriteCanvas.draw_text text x y 1
    ))

let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list GraphicsV1.[
        Clear;
        SetSpriteSheet sprite_sheet;
        SetFont CharacterSprites.find;
        DrawSprite ("character", (50, 30));
        DrawText ("JORDAN", (50, 0));
    ] (* : GraphicsV1.t observable *)
    (* : GraphicsV1.t -> GraphicsV1State.t *)
    (* scan : (GraphicsV1State.t -> GraphicsV1.t -> int -> GraphicsV1State.t) -> GraphicsV1State.t -> (GraphicsV1.t, GraphicsV1State.t) operator_function *)
    (* : GraphicsV1.t -> GraphicsV1State.t -> SpriteCanvas.t list *)
    (* : GraphicsV1.t observable -> SpriteCanvas.t observable *)
        (*|> RxJS.map TextToSpriteCanvas.f
        |> RxJS.concat_list
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list*)
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

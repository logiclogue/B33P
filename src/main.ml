let sprite_sheet id =
    match id with
    | "character" -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

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
    (* scan : ('b -> GraphicsV1.t -> int -> 'b) -> 'b -> (GraphicsV1.t, 'b) operator_function *)
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

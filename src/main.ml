let sprite_sheet id =
    match id with
    | _ -> [
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
        SetTextColour Colours.white;
        DrawSprite ("character", (50, 30));
        SetTextColour Colours.white;
        DrawText ("JORDAN", (50, 0));
        SetTextColour Colours.blue;
        DrawText ("BLAH", (50, 8));
    ]
        |> GraphicsV1ToSpriteObs.f
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

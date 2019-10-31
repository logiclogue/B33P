let sprite_sheet id =
    match id with
    | "A" -> CharacterSprites.find 'A'
    | "B" -> CharacterSprites.find 'B'
    | "C" -> CharacterSprites.find 'C'
    | _ -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

let animations id =
    match id with
    | "ABC" -> (["A"; "B"; "C"], 300)
    | _ -> (["A"], 1000)

let graphics_v2_to_graphics_v1_obs (gra)(**!!!TODO!!!!!!1**)

let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list GraphicsV2.[
        SetSpriteSheet sprite_sheet;
        SetFont CharacterSprites.find;
        SetTextColour Colours.white;
        SetAnimations animations;

        CreateEntity ("Jordan", (50, 50));
        SetAnimation ("Jordan", "ABC");
    ]
        |> graphics_v2_to_graphics_v1_obs
        |> GraphicsV1ToSpriteObs.f
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

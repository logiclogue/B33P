open Core

let () =
    let canvas = RgbCanvas.create () in

    let letter_a = [
        [0; 0; 7; 7; 7; 7; 0; 0];
        [0; 7; 7; 0; 0; 7; 7; 0];
        [0; 7; 7; 0; 0; 7; 7; 0];
        [0; 7; 7; 7; 7; 7; 7; 0];
        [0; 7; 7; 0; 0; 7; 7; 0];
        [0; 7; 7; 0; 0; 7; 7; 0];
        [0; 7; 7; 0; 0; 7; 7; 0];
        [0; 0; 0; 0; 0; 0; 0; 0];
    ] in

    RxJS.create_of_list [
        SpriteCanvas.DrawSprite (letter_a, 0, 10);
        SpriteCanvas.DrawSprite (letter_a, 8, 10);
    ]
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

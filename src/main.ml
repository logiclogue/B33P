let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list [
        SpriteCanvas.DrawSprite ([[7; 7; 4]; [7; 7; 1]; [1; 1; 1]], 10, 10);
    ]
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

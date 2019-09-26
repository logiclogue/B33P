let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list [
        SpriteCanvas.DrawSprite ([[0; 0]; [0; 0]], 0, 0);
    ]
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

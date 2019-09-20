let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list [
        EightColourCanvas.Clear;
        EightColourCanvas.SetPixelXY (0, 0, 7);
        EightColourCanvas.SetPixelXY (1, 1, 7);
        EightColourCanvas.SetPixelXY (2, 2, 7);
        EightColourCanvas.SetPixelXY (3, 3, 7);
    ]
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

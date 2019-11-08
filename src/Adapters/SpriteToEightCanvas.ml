let clear =
    [|EightColourCanvas.Clear|]

let draw_sprite colourss x y =
    colourss
        |> Array.mapi (fun yth -> (
            Array.mapi (fun xth value -> (
                EightColourCanvas.SetPixelXY (value, xth + x, yth + y)
            ))
        ))
        |> Array.flatten

let f action =
    match action with
    | SpriteCanvas.Clear                       -> clear
    | SpriteCanvas.DrawSprite (colourss, x, y) -> draw_sprite colourss x y

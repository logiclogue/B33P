let clear =
    [SpriteCanvas.Clear]

let draw_char c x y =
    [
        SpriteCanvas.DrawSprite (CharacterSprites.find c, x, y)
    ]

let draw_text text x y =
    StringHelpers.to_list text
        |> List.mapi (fun i c -> draw_char c (x + (i * 8)) y)
        |> List.flatten

let f action =
    match action with
    | TextCanvas.Clear                 -> clear
    | TextCanvas.DrawChar (c, x, y)    -> draw_char c x y
    | TextCanvas.DrawText (text, x, y) -> draw_text text x y

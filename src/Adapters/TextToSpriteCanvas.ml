let clear =
    [SpriteCanvas.Clear]

let apply_colour colour =
    List.map (List.map (fun x -> x * colour))

let draw_char c x y colour =
    let original_character = CharacterSprites.find c in

    [
        SpriteCanvas.DrawSprite (apply_colour colour original_character, x, y)
    ]

let draw_text text x y colour =
    StringHelpers.to_list text
        |> List.mapi (fun i c -> draw_char c (x + (i * 8)) y colour)
        |> List.flatten

let f action =
    match action with
    | TextCanvas.Clear                         -> clear
    | TextCanvas.DrawChar (c, x, y, colour)    -> draw_char c x y colour
    | TextCanvas.DrawText (text, x, y, colour) -> draw_text text x y colour

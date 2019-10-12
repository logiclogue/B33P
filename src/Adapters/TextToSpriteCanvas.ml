let draw_char c x y =
    [
        SpriteCanvas.DrawSprite (CharacterSprites.find c, x, y)
    ]

let draw_text text x y =
    StringHelpers.to_list text
        |> List.map (fun c -> draw_char c x y)
        |> List.flatten

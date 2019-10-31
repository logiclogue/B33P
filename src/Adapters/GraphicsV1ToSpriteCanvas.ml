let f action state =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> [SpriteCanvas.Clear]
        | SetSpriteSheet _ -> []
        | SetFont _ -> []
        | SetTextColour _ -> []
        | DrawSprite (sprite, (x, y)) ->
            [SpriteCanvas.DrawSprite (find_sprite sprite state, x, y)]
        | DrawText (text, (x, y)) ->
            TextToSpriteCanvas.draw_text text x y (get_text_colour state)
    ))

let f action state =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> [SpriteCanvas.Clear]
        | SetSpriteSheet sprite_sheet -> []
        | SetFont font -> []
        | SetTextColour text_colour -> []
        | DrawSprite (sprite, (x, y)) ->
            [SpriteCanvas.DrawSprite (find_sprite sprite state, x, y)]
        | DrawText (text, (x, y)) ->
            TextToSpriteCanvas.draw_text text x y (get_text_colour state)
    ))

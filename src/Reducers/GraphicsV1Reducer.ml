let reduce state action =
    GraphicsV1.(GraphicsV1State.(
        match action with
        | Clear -> state
        | SetSpriteSheet sprite_sheet -> set_sprite_sheet sprite_sheet state
        | SetFont font -> set_font font state
        | SetTextColour text_colour -> set_text_colour text_colour state
        | DrawSprite _ -> state
        | DrawText _ -> state
    ))

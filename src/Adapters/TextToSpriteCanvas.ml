let draw_char c x y =
    [
        SpriteCanvas.DrawSprite (CharacterSprites.find c, x, y)
    ]

let draw_text text x y =
    

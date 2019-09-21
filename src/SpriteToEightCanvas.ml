let clear =
    EightColourCanvas.Clear

let draw_sprite colourss x y =
    []

let f action =
    match action with
    | SpriteCanvas.Clear                       -> clear
    | SpriteCanvas.DrawSprite (colourss, x, y) -> draw_sprite colourss x y

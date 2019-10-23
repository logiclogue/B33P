type id = string
type coords = int * int

type t =
    | Clear
    | SetSpriteSheet of (id -> int list list)
    | SetFont of (char -> int list list)
    | DrawSprite of id * coords
    | DrawText of string * coords

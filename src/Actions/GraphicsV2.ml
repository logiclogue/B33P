type entity_id = string
type sprite_id = string
type time_interval_ms = int
type coords = int * int

type t =
    | SetSpriteSheet of (sprite_id -> int list list)
    | SetFont of (char -> int list list)
    | SetAnimations of (animation_id -> (sprite_id list * time_interval_ms))
    | SetTextColour of Colours.t
    | CreateEntity of entity_id * coords
    | SetAnimation of entity_id * animation_id

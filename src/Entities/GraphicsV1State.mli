type t

val default : t

val set_sprite_sheet : (GraphicsV1.id -> int list list) -> t -> t
val set_font : (char -> int list list) -> t -> t
val set_text_colour : Colours.t -> t -> t

val get_sprite_sheet : t -> (GraphicsV1.id -> int list list)
val get_font : t -> (char -> int list list)
val get_text_colour : t -> Colours.t

val find_sprite : GraphicsV1.id -> t -> int list list

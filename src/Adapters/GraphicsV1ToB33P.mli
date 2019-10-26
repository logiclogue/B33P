(*type t = (GraphicsV1Entity.t -> GraphicsV1Entity.t) * SpriteCanvas.t

val clear : t
val set_sprite_sheet : (id -> int list list) -> t
val set_font : (char -> int list list) -> t
val draw_sprite : (id * coords) -> t
val draw_text : (string * coords) -> t

val f : GraphicsV1.t -> t*)

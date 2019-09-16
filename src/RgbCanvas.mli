type t

val create        : unit -> t
val start         : t -> unit
val set_pixel_i   : t -> int -> bool -> unit
val put_data      : t -> unit
val dispatch      : t -> RgbCanvasAction.t -> unit

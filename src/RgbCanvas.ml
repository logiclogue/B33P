val create        : unit -> t
val start         : t -> unit
val set_pixel_i   : t -> int -> bool -> unit
external put_data : t -> unit [@@bs.module "RgbCanvas.js"] [@@bs.val "putData"]
val dispatch      : t -> RgbCanvasAction.t -> unit

open RgbCanvasAction

type t = Js.Json.t

external create
    : unit -> t
    = "create"
    [@@bs.module "../Foreign/RgbCanvas"] [@@bs.val]

external start
    : t -> unit
    = "start"
    [@@bs.module "../Foreign/RgbCanvas"] [@@bs.val]

external set_pixel_i
    : t -> int -> bool -> unit
    = "setPixelI"
    [@@bs.module "../Foreign/RgbCanvas"] [@@bs.val]

external put_data
    : t -> unit
    = "putData"
    [@@bs.module "../Foreign/RgbCanvas"] [@@bs.val]

let dispatch self = function
    | Start                    -> start self
    | SetPixelI (i, on_or_off) -> set_pixel_i self i on_or_off
    | PutData                  -> put_data self
    | _                        -> ()

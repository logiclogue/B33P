open RgbCanvasAction

type t = Js.Json.t

external create
    : unit -> t
    = "create"
    [@@bs.module "./RgbCanvas"] [@@bs.val]

external start
    : t -> unit
    = "start"
    [@@bs.module "./RgbCanvas"] [@@bs.val]

external set_pixel_i
    : t -> int -> bool -> unit
    = "setPixelI"
    [@@bs.module "./RgbCanvas"] [@@bs.val]

external put_data
    : t -> unit
    = "putData"
    [@@bs.module "./RgbCanvas"] [@@bs.val]

let dispatch self = function
    | SetPixelI (i, on_or_off) -> set_pixel_i self i on_or_off
    | PutData                  -> put_data self
    | _                        -> ()

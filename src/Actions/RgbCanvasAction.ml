type on_or_off = bool
type i         = int

type t =
    | Clear
    | Start
    | SetPixelI of i * on_or_off
    | PutData

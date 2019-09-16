type on_or_off = bool
type i         = int

type t =
    | Clear
    | SetPixelI of i * on_or_off
    | PutData

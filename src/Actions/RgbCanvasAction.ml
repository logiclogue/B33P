type on_or_off = int
type i         = int

type t =
    | Clear
    | SetPixelI of i * on_or_off
    | PutData

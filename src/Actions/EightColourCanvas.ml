type t =
    | Clear
    | SetPixelXY of int * int * int

module Set = Set.Make(string)

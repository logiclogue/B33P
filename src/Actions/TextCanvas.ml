type colour = int

type t =
    | Clear
    | DrawChar of char * int * int * colour
    | DrawText of string * int * int * colour

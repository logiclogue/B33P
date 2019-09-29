type t =
    | Clear
    | DrawChar of char * int * int
    | DrawText of string * int * int

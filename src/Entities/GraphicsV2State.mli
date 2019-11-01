type t

val default : t

val set_animations : (string -> (string list * int)) -> t -> t
val create_entity : string -> (int * int) -> t -> t
val set_animation : string -> string -> t -> t

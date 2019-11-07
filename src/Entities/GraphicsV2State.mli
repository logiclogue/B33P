type t

val default : t

val set_animations : (string -> (string list * int)) -> t -> t
val create_entity : string -> (int * int) -> t -> t
val set_animation : string -> string -> t -> t
val set_tick_function : (t -> t) -> t -> t

val get_entities : t -> (string * (int * int)) list
val get_tick_function : t -> (t -> t)

val map_entities : ((string * (int * int)) -> (string * (int * int))) -> t -> t

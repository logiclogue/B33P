type t = {
    animations : string -> (string list * int);
    entities : (string * (int * int)) list;
    animation_to_entity : (string * string) list;
    tick_function : t -> t;
    time: int;
}

let default = {
    animations = (fun _ -> ([], 0));
    entities = [];
    animation_to_entity = [];
    tick_function = (fun state -> state);
    time = 0;
}

let set_animations animations self =
    { self with animations }

let create_entity entity_id coords self =
    let { entities } = self in

    { self with entities = ((entity_id, coords) :: entities) }

let set_animation entity_id animation_id self =
    let { animation_to_entity } = self in

    { self with animation_to_entity = (entity_id, animation_id) :: animation_to_entity }

let set_tick_function tick_function self =
    { self with tick_function }

let get_entities { entities } =
    entities

let get_tick_function { tick_function } =
    tick_function

let map_entities f self =
    let entities = get_entities self in

    let mapped_entities = List.map f entities in

    { self with entities = mapped_entities }

let get_animation_from_entity entity_id self =
    let { animation_to_entity; animations } = self in

    animation_id

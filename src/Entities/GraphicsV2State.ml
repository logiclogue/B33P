type t = {
    animations : string -> (string list * int);
    entities : (string * (int * int)) list;
    animation_to_entity : (string * string) list;
}

let default = {
    animations = (fun _ -> ([], 0));
    entities = [];
    animation_to_entity = [];
}

let set_animations animations self =
    { self with animations }

let create_entity entity_id coords self =
    let { entities } = self in

    { self with entities = ((entity_id, coords) :: entities) }

let set_animation entity_id animation_id self =
    let { animation_to_entity } = self in

    { self with animation_to_entity = (entity_id, animation_id) :: animation_to_entity }

let get_entities { entities } =
    entities

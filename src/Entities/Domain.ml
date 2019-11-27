type milliseconds = int
type coordinate = int
type coords = coordinate * coordinate

type sprite_id = string
type animation_id = string
type animation = animation_id * sprite_id list * milliseconds

type entity_attribute =
    | Sprite of sprite_id
    | Animation of animation_id
    | SubEntity of entity_id

type entity_id = string
type entity = string * coords * entity_attribute list

type scene_state = {
    entities: entity list;
}

type scene = {
    entities: entity list;
    blah: entity -> scene_state -> scene_state;
}

type game_state = {
    scenes: scene_state list;
}

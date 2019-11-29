type milliseconds = int
type coordinate = int
type coords = coordinate * coordinate

type sprite_id = string
type animation_id = string
type animation = animation_id * sprite_id list * milliseconds

type entity_attributes =
    | Animation of animation_id
    | SubEntities of entity_id list

type entity_id = string
type entity = coords * entity_attributes

type scene_state = {
    entities: entity list;
}

type game_state = {
    time: milliseconds;
    current_scene: scene_state;
    scenes: scene_state list;
}

type game_update = game_state -> game_state
type scene_update = scene_state -> scene_state
type entity_update = entity -> entity

type action =
    | GameUpdate of game_update
    | SceneUpdate of scene_update
    | EntityUpdate of entity_update
    | SwitchScene of scene_id

type scene_seed = {
    entities: entity list;
    update: scene_state -> action
}

type game_seed = {
    scenes: scene_seed list;
}

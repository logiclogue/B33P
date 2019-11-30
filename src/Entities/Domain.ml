type milliseconds = int
type coordinate = int
type coords = coordinate * coordinate
type colour = Colours.t
type time = milliseconds

type sprite_id = string
type sprite = int list list
type sprite_sheet = sprite_id -> sprite

type font = char -> sprite

type animation_id = string
type animation = sprite_id list * milliseconds
type animations = animation_id -> animation

type entity_id = string
type entity_attributes =
    | Animation of animation_id
    | SubEntities of entity_id list
type entity = coords * entity_attributes
type entities = entity list

type scene_state = {
    entities : entities;
}

type game_state = {
    time : time;
    current_scene : scene_state;
    scenes : scene_state list;
    sprite_sheet : sprite_sheet;
    font : font;
    animations : animations;
}

type game_update = game_state -> game_state
type scene_update = scene_state -> scene_state
type entity_update = entity -> entity

type action =
    | SwitchScene of scene_id
    | SetSpriteSheet of sprite_sheet
    | SetFont of font
    | SetAnimations of animations
    | SetTextColour of colour
    | CreateEntity of entity
    | SetAnimation of entity_id * animation_id
    | Tick

type scene_seed = {
    entities : entities;
    update : scene_update;
}

type game_seed = {
    scenes : entities;
    update : game_update;
}

let draw_scene scene_state time : GraphicsV1.t list =
    []

type t = {
    sprite_sheet: GraphicsV1.id -> int list list;
    font: char -> int list list;
}

let default =
    {
        sprite_sheet = (fun _ -> []);
        font = (fun _ -> []);
    }

let set_sprite_sheet sprite_sheet self =
    { self with sprite_sheet }

let set_font font self =
    { self with font }

let get_sprite_sheet { sprite_sheet } =
    sprite_sheet

let get_font { font } =
    font

let find_sprite id { sprite_sheet } =
    sprite_sheet id

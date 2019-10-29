type t = {
    sprite_sheet: GraphicsV1.id -> int list list;
    font: char -> int list list;
    text_colour: Colours.t;
}

let default =
    {
        sprite_sheet = (fun _ -> []);
        font = (fun _ -> []);
        text_colour = Colours.white;
    }

let set_sprite_sheet sprite_sheet self =
    { self with sprite_sheet }

let set_font font self =
    { self with font }

let set_text_colour text_colour self =
    { self with text_colour }

let get_sprite_sheet { sprite_sheet } =
    sprite_sheet

let get_font { font } =
    font

let get_text_colour { text_colour } =
    text_colour

let find_sprite id { sprite_sheet } =
    sprite_sheet id

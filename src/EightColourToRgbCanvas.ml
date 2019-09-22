let width = 512

let _xy_to_i width x y =
    (y * width) + x

let set_pixel_xy x y colour =
    let new_x = x * 2 in
    let new_y = y * 2 in

    let xy_to_i = _xy_to_i width in

    let is_bit_set n_digit number =
        (((number lsl n_digit) asr 2) land 1) == 1 in

    let get_colour x y =
        let i = xy_to_i x y in
        let prim_colour = i mod 3 in

        is_bit_set prim_colour colour in

    [
        RgbCanvasAction.SetPixelI (xy_to_i new_x new_y, get_colour new_x new_y);
        RgbCanvasAction.SetPixelI (xy_to_i (new_x + 1) new_y, get_colour (new_x + 1) new_y);
        RgbCanvasAction.SetPixelI (xy_to_i new_x (new_y + 1), get_colour new_x (new_y + 1));
        RgbCanvasAction.SetPixelI (xy_to_i (new_x + 1) (new_y + 1), get_colour (new_x + 1) (new_y + 1));
    ]

let clear = [RgbCanvasAction.Clear]

let f action = match action with
    | EightColourCanvas.Clear                     -> clear
    | EightColourCanvas.SetPixelXY (x, y, colour) -> set_pixel_xy x y colour

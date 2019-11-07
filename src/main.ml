let sprite_sheet id =
    match id with
    | "A" -> CharacterSprites.find 'A'
    | "B" -> CharacterSprites.find 'B'
    | "C" -> CharacterSprites.find 'C'
    | _ -> [
        [0; 0; 0; 1; 1; 1; 1; 1; 0; 0; 0; 0];
        [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0];
        [0; 0; 2; 2; 2; 3; 3; 2; 3; 0; 0; 0];
        [0; 2; 3; 2; 3; 3; 3; 2; 3; 3; 3; 0];
        (* TODO: THE REST OF SPRITE *)
    ]

let animations id =
    match id with
    | "ABC" -> (["A"; "B"; "C"], 300)
    | _ -> (["A"], 1000)

let actions_to_state (state : GraphicsV2State.t) (action : GraphicsV2.t) : GraphicsV2State.t =
    GraphicsV2State.(GraphicsV2.(
        match action with
        | SetSpriteSheet sprite_sheet ->
            state

        | SetFont font ->
            state

        | SetAnimations animations ->
            set_animations animations state

        | SetTextColour colour ->
            state

        | CreateEntity (entity_id, coords) ->
            create_entity entity_id coords state

        | SetAnimation (entity_id, animation_id) ->
            set_animation entity_id animation_id state

        | SetTickFunction f ->
            set_tick_function f state
    ))

let action_to_actions (action : GraphicsV2.t) (state : GraphicsV2State.t) : GraphicsV1.t list =
    GraphicsV2.(
        match action with
        | SetSpriteSheet sprite_sheet ->
            [GraphicsV1.SetSpriteSheet sprite_sheet]

        | SetFont font ->
            [GraphicsV1.SetFont font]

        | SetAnimations _ ->
            []

        | SetTextColour colour ->
            [GraphicsV1.SetTextColour colour]
            
        | CreateEntity _ ->
            []

        | SetAnimation _ ->
            []

        | SetTickFunction _ ->
            []
    )

let draw_state (state : GraphicsV2State.t) (time : int) : GraphicsV1.t list =
    let draw_entity ((entity_id, (x, y)) : (string * (int * int))) : GraphicsV1.t list =
        [DrawText (entity_id, (x, y))] in

    let draw_entities (entities : (string * (int * int)) list) : GraphicsV1.t list =
        List.map draw_entity entities
            |> List.concat in

    draw_entities (GraphicsV2State.get_entities state)

let graphics_v2_to_graphics_v1_obs (graphics_v2_obs : GraphicsV2.t RxJS.observable) : GraphicsV1.t RxJS.observable =
    let f (state : GraphicsV2State.t) (action : GraphicsV2.t) _ : GraphicsV2State.t =
        actions_to_state state action in

    let state_obs =
        RxJS.scan f GraphicsV2State.default graphics_v2_obs in (* TODO HERE *)

    RxJS.interval 1000 RxJS.animation_frame
        |> RxJS.with_latest_from state_obs
        |> RxJS.map (fun (time, state) -> draw_state state time)
        |> RxJS.concat_list
        |> RxJS.tap Js.log

let () =
    let canvas = RgbCanvas.create () in

    RxJS.create_of_list GraphicsV2.[
        SetSpriteSheet sprite_sheet;
        SetFont CharacterSprites.find;
        SetTextColour Colours.white;
        SetAnimations animations;
        SetTickFunction GraphicsV2State.(fun state ->
            map_entities (fun (id, (x, y)) -> (id, (x + 1, y))) state
        );

        CreateEntity ("Jordan", (50, 50));
        SetAnimation ("Jordan", "ABC");
        CreateEntity ("ABC", (0, 0));
    ]
        |> graphics_v2_to_graphics_v1_obs
        |> GraphicsV1ToSpriteObs.f
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action; RgbCanvasAction.PutData])
        |> RxJS.concat_list
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

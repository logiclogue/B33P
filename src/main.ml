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

        | Tick ->
            get_tick_function state state
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

        | Tick ->
            []
    )

let draw_state (state : GraphicsV2State.t) (time : int) : GraphicsV1.t list =
    let get_animation_from_entity
        (entity_id : GraphicsV2State.entity_id)
        (state : GraphicsV2State.t)
        : GraphicsV2State.animation_id =

        let animation_id = GraphicsV2State.get_animation_from_entity_id

        animation_id in

    let current_sprite (time : int) (animation : (string list * int))
        : string =

        let (sprites, interval) = animation in

        let i = (time / interval) mod List.length sprites in

        List.nth sprites i in

    let draw_entity ((entity_id, (x, y)) : (string * (int * int)))
        : GraphicsV1.t list =

        let animation =
            GraphicsV2State.get_animation_from_entity entity_id state in

        let time = GraphicsV2State.get_time state in

        let sprite = current_sprite time animation in

        [DrawSprite (sprite, (x, y))] in

    let draw_entities
        (entities : (string * (int * int)) list)
        (animations : string -> (string list * int))
        : GraphicsV1.t list =

        List.map draw_entity entities
            |> List.concat in

    let entities = GraphicsV2State.get_entities state in
    let animations = GraphicsV2State.get_animations state in

    draw_entities entities animations

let graphics_v2_to_graphics_v1_obs
    (graphics_v2_obs : GraphicsV2.t RxJS.observable)
    : GraphicsV1.t RxJS.observable =

    let f (state : GraphicsV2State.t) (action : GraphicsV2.t) _
        : GraphicsV2State.t =

        actions_to_state state action in

    let state_obs =
        RxJS.scan f GraphicsV2State.default graphics_v2_obs in

    RxJS.interval 100 RxJS.animation_frame
        |> RxJS.with_latest_from state_obs
        |> RxJS.map (fun (time, state) -> draw_state state time)
        |> RxJS.concat_list

let () =
    let canvas = RgbCanvas.create () in

    let tick_obs =
        RxJS.interval 100 RxJS.animation_frame
            |> RxJS.map (fun _ -> GraphicsV2.Tick) in

    let init_obs =
        RxJS.create_of_list GraphicsV2.[
            SetSpriteSheet sprite_sheet;
            SetFont CharacterSprites.find;
            SetTextColour Colours.white;
            SetAnimations animations;
            SetTickFunction GraphicsV2State.(fun state ->
                map_entities (fun (id, (x, y)) -> (id, (x + 10, y))) state
            );

            CreateEntity ("Jordan", (50, 50));
            SetAnimation ("Jordan", "ABC");
            CreateEntity ("ABC", (0, 0));
            CreateEntity ("BLAH", (0, 8));
            CreateEntity ("ABC", (0, 16));
        ]
        |> RxJS.share () in
        
    let action_obs = RxJS.merge [|tick_obs; init_obs|]
        |> graphics_v2_to_graphics_v1_obs
        |> GraphicsV1ToSpriteObs.f
        |> RxJS.map SpriteToEightCanvas.f
        |> RxJS.concat_list
        |> RxJS.map EightColourToRgbCanvas.f
        |> RxJS.concat_list
        |> RxJS.map (fun action -> [action])
        |> RxJS.concat_list
        |> RxJS.share () in

    let put_data_obs = RxJS.interval 100 RxJS.animation_frame
        |> RxJS.map (fun _ -> RgbCanvasAction.PutData)
        |> RxJS.share () in

    RxJS.merge [|action_obs; put_data_obs|]
        |> RxJS.subscribe (RgbCanvas.dispatch canvas)

let f graphics_v1_obs =
    let action_to_actions = GraphicsV1ToSpriteCanvas.f in
    let actions_to_state = GraphicsV1Reducer.reduce in

    let f (_, old_state) action _ = 
        let state = actions_to_state old_state action in

        (action_to_actions action state, state) in

    graphics_v1_obs
        |> RxJS.scan f ([], GraphicsV1State.default)
        |> RxJS.map (fun (actions, _) -> actions)
        |> RxJS.concat_list

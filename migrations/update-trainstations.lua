if not technology or game.get_player(1).force.technologies[technology].researched then
    for _,stop in pairs(game.get_surface(1).find_entities_filtered{type="train-stop"}) do
        global.custom_entities[stop.unit_number]=trainstation:new(stop)
    end
end
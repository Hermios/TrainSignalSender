require "__Hermios_Gui_Framework__.control-libs"
require "constants"
require "prototypes.train"
require "prototypes.trainstation"
require "methods.remote"
require "guis.train"
local is_init=true
table.insert(list_events.on_tick,function()
    if is_init then
        game.get_player(1).gui.screen.clear()
        is_init=false
    end
end)

table.insert(list_events.on_train_changed_state,function(event)
    if global.custom_entities[event.train.id] then
        if event.old_state==defines.train_state.wait_station and event.train.schedule and not event.train.schedule.records[event.train.schedule.current].temporary or
            event.train.state==defines.train_state.wait_station then
                global.custom_entities[event.train.id]:update_station_network()
        end
    end
end)

table.insert(list_events.on_research_finished,function(event)
   if event.research.name==technology then
        for _,trainstation in pairs(game.get_surface(1).find_entities_filtered{name="train-station"}) do
            on_built(trainstation)
        end
   end
end)
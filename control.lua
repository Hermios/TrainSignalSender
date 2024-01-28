require "__Hermios_Gui_Framework__.control-libs"
require "constants"
require "prototypes.train"
require "prototypes.trainstation"
require "methods.remote"
require "guis.train"

table.insert(list_events.on_train_changed_state,function(event)
    if global.custom_entities[event.train.id] then
        if event.old_state==defines.train_state.wait_station and not event.train.schedule.records[event.train.schedule.current].temporary or
            event.train.state==defines.train_state.wait_station then
                global.custom_entities[event.train.id]:update_station_network()
        end
    end
end)
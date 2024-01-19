require "__HermiosLibs__.control-libs"
require "constants"
require "prototypes.train"
require "prototypes.trainstation"
require "methods.remote"
require "guis.train"

function on_train_changed_state(event)
    if global.custom_entities[event.train.id] then
        if event.old_state==defines.train_state.wait_station or event.train.state==defines.train_state.wait_station then
            global.custom_entities[event.train.id]:update_station_network()
        end
    end
end
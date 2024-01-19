set_signals= function (trainid,signals)
	if not global.custom_entities[trainid] then
		return
	end
	for _,signal in pairs(signals) do
		table.insert(global.custom_entities[trainid].control_behavior.signals,signal)
	end
end

clear_signals= function (trainid)
	if global.custom_entities[trainid] then
		global.custom_entities[trainid].control_behavior.signals={}
	end
end

get_signals=function(trainid)
	if global.custom_entities[trainid] then
		return global.custom_entities[trainid].control_behavior.signals
	end
end

has_signal=function(trainid,isignal)
	if not global.custom_entities[trainid] then
		return
	end
	for _,signal in pairs(global.custom_entities[trainid].control_behavior.signals) do
		if signal.signal and signal.signal.name==isignal.name and signal.signal.type==isignal.type then
			return true
		end
	end
	return false
end

function init_remote()
remote.add_interface
	(modname,
		{
			set_signals=set_signals,
			clear_signals=clear_signals,
			get_signals=get_signals,
			has_signal=has_signal
		}
	)
end
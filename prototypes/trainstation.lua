trainstation={}
custom_prototypes["train-stop"]=trainstation

function trainstation:new(entity)
	local sender = entity.surface.create_entity({name=trainstop_combinator,position=entity.position,force=entity.force})
		sender.operable = false
		sender.minable = false
		sender.destructible = false
		entity.connect_neighbour{wire=defines.wire_type.green,target_entity=sender}
		entity.connect_neighbour{wire=defines.wire_type.red,target_entity=sender}
	return {
		entity=entity,
		sender=sender
	}
end

function trainstation:update_network()
	self.sender.get_or_create_control_behavior().parameters=((global.custom_entities[(self.entity.get_stopped_train() or {}).id] or {}).control_behavior or {}).parameters
end

function trainstation:on_removed()
	self.sender.destroy()
end
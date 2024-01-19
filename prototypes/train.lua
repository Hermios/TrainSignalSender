train={}
custom_prototypes["train"]=train

function train:update_station_network()
	global.custom_entities[(self.station or self.entity.station).unit_number]:update_network()
	if self.station then
		self.station=nil
	else
		self.station=self.entity.station
	end
end

function train:on_gui_changed()
	if self.entity.station then
		global.custom_entities[self.entity.station.unit_number]:update_network()
	end
end
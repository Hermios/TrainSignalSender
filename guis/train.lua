custom_guis["train"]={
	position="left",
	gui=
	{
		type="frame", direction="vertical",
		tags={
			children={
				{type="label",caption={"gui-signal-title"}},
				{
					type="frame", direction="vertical",tags={
						id="parameters",
						model={
							{
								type="label",
								tags={id="index",on_load="update_index_caption"},
							},
							{
								type="choose-elem-button",
								elem_type="signal",
								tags={id="signal"}
							},{
								type="slider",
								tags={id="count",on_action="update_count"},
								style="other_settings_slider",
								discrete_slider=true,
								name="slider"
							},{
								type="textfield",
								name="textfield",
								numeric=true,
								allow_negative=true,
								tags={id="count",on_action="update_count"},
								style="slider_value_textfield"
							}
						}
					}
				}
			}
		}
	}
}

function update_index_caption(lua_gui_element)
	lua_gui_element.caption=lua_gui_element.parent.tags.id
end

function update_count(gui_element)
	data=gui_element.type=="slider" and
		{
			source_value="slider_value",
			gui_element="textfield",
			dest_value="text",
			convert=tostring
		} or
		{
			source_value="text",
			gui_element="slider",
			dest_value="slider_value",
			convert=tonumber
		}
	gui_element.parent[data.gui_element][data.dest_value]=data.convert(gui_element[data.source_value])
end
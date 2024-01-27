custom_guis["train"]={
	position="screen",
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

function update_count(lua_gui_element)
	local frame=lua_gui_element.parent
	if lua_gui_element.type=="slider" then
        frame.textfield.text=tostring(lua_gui_element.slider_value)
    elseif lua_gui_element.text~="" then
        frame.slider.slider_value=tonumber(lua_gui_element.text)
    end
end
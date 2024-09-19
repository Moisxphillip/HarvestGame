extends PanelContainer

var item_data = null

func init(cms: Vector2)-> void:
	custom_minimum_size = cms
	
func _can_drop_data(at_position: Vector2, data: Variant)-> bool:
	return data.data.sellable
	
func _drop_data(at_position: Vector2, data: Variant)-> void:
	Money.add_money(data.data.price_sell)
	if get_child_count() > 0:
		get_child(0).queue_free()
	data.reparent(self)
	


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if (event.button_index == 1) and (event.button_mask == 1):
			if get_child_count() > 0:
				Money.sub_money(get_child(0).data.price_sell)
				$"../..".add_item_data(get_child(0))
	pass # Replace with function body.

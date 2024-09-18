extends PanelContainer


func init(cms: Vector2)-> void:
	custom_minimum_size = cms
	
func _can_drop_data(at_position: Vector2, data: Variant)-> bool:
	return data.data.sellable
	
func _drop_data(at_position: Vector2, data: Variant)-> void:
	#TODO money
	if get_child_count() > 0:
		get_child(0).queue_free()
	data.reparent(self)

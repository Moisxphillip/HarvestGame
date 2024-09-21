extends PanelContainer

var item_data = null

func init(cms: Vector2)-> void:
    custom_minimum_size = cms
    
func _can_drop_data(at_position: Vector2, data: Variant)-> bool:
    return data.data.sellable
    
func _drop_data(at_position: Vector2, data: Variant)-> void:
    Hud.get_money(data.data.price_sell * data.data.count)
    data.queue_free()
    $Sell.play()

#func _on_gui_input(event):
	#if event is InputEventMouseButton:
		#if (event.button_index == 1) and (event.button_mask == 1):
			#if get_child_count() > 0:
				#Hud.spend_money(get_child(0).data.price_sell * get_child(0).data.count)
				#$"../..".add_item_data(get_child(0))

class_name BagSlot
extends PanelContainer

#@export var type: ItemData.Type
signal item_changed(slot: BagSlot)

#func init(t: ItemData.Type, cms: Vector2)-> void:
func init(cms: Vector2)-> void:
	custom_minimum_size = cms
	
func _can_drop_data(at_position: Vector2, data: Variant)-> bool:
	return true
	
func _drop_data(at_position: Vector2, data: Variant)-> void:
	if get_child_count() > 0:
		var item := get_child(0)
		item.reparent(data.get_parent())
	
	var data_parent = data.get_parent()
	data.reparent(self)	
	
	#dispara signal nos dois slots para efetuar a sincronização nos dois
	if data_parent is BagSlot:
		data_parent.emit_change_state()
	emit_change_state()
	
func sync_slot(slot: BagSlot)->void:
	slot.item_changed.connect(copy_slot_info)
	
func copy_slot_info(slot):
	if get_child_count() > 0:
		print(slot.get_child_count())
		if slot.get_child_count()>0:
			get_child(0).queue_free()
			add_child(slot.get_child(0).duplicate())		
		else:
			get_child(0).queue_free()
	else:
		if slot.get_child_count()>0:
			add_child(slot.get_child(0).duplicate())
			
func emit_change_state():
	emit_signal("item_changed", self)


func _physics_process(delta:float)->void:
	pass
	#if get_child_count() > 0:
		#var item := get_child(0)
		#match type:
			#ItemData.Type.Weapon:
				 #Game.right_hand_equipped = item.data
			##body item data
			#_:
				#Game.right_hand_equipped = item.data

#func _gui_input(event: InputEvent)-> void:
	#pass
	#if event is InputEventMouseButton:
		#if (event.button_index == 1 and (event.button_mask ==1 )):
			#if get_child_count() > 0:
				#if (get_child(0)).data.type == ItemData.Type.MISC:
					#Game.heal_player(get_child(0).data.item_health)
					#get_child(0).data.count -= 1
					#get_child(0).get_child(0).text = str(get_child(0).data.count)
					#if get_child(0).data.count <= 0:
						#get_child(0).queue_free()

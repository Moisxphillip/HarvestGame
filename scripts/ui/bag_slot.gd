class_name BagSlot
extends PanelContainer

#@export var type: ItemData.Type
signal item_changed(slot: BagSlot)
var is_shorcut = false

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

func set_is_shorcut(value):
	is_shorcut = value
	
func get_is_shortcut():
	return is_shorcut

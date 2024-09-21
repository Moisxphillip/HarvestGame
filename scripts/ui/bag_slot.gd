class_name BagSlot
extends PanelContainer

#@export var type: ItemData.Type
signal item_changed(slot: BagSlot)
var is_shorcut = false

#func init(t: ItemData.Type, cms: Vector2)-> void:
func init(cms: Vector2)-> void:
    custom_minimum_size = cms
    
func _can_drop_data(_at_position: Vector2, _data: Variant)-> bool:
    return true
    
func _drop_data(_at_position: Vector2, data: Variant)-> void:
    if get_child_count() > 0:
        var item := get_child(0)
        item.reparent(data.get_parent())
    
    data.reparent(self)	

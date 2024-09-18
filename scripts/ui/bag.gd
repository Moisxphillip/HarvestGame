extends Control

var items_to_load = [
	"res://resources/hoe.tres",
	"res://resources/watering_can.tres",
	"res://resources/flower_1_seed.tres"
]

@onready var BagGrid = get_node("Panel/BagGrid")
@onready var ShortcutGrid = get_node("Panel/ShortcutGrid")
@export var bag_size = 24

func _ready():
	for i in range(bag_size):
		var slot = BagSlot.new()
		slot.init(Vector2(32,32))
		BagGrid.add_child(slot)
	for i in items_to_load.size():
		var item = BagItem.new()
		item.init(load(items_to_load[i]))
		ShortcutGrid.get_child(i).add_child(item)
		$"../ShortcutItems".get_child(i).add_child(item.duplicate())
		$"../ShortcutItems".get_child(i).add_child(item)
	

func add_item(item_name: String) -> void: 
	var item = BagItem.new()
	item.init(Items.items[item_name])
	if item.data.stackable:
		for i in bag_size:
			if BagGrid.get_child(i).get_child_count() > 0:
				if BagGrid.get_child(i).get_child(0).data == item.data:
					BagGrid.get_child(i).get_child(0).data.count += 1
					BagGrid.get_child(i).get_child(0).get_child(0).text =  str(BagGrid.get_child(i).get_child(0).data.count)
					break
			else:
				BagGrid.get_child(item).add_child(i)
				break
	else:
		for i in bag_size:
			if BagGrid.get_child(i).get_child_count() ==  0:
				BagGrid.get_child(i).add_child(item)
				break
				

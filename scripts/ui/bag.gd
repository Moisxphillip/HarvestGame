extends Control

var items_to_load = [
    "res://resources/ype_seed.tres"
]

@onready var BagGrid = get_node("Panel/BagGrid")
#@onready var ShortcutGrid = get_node("Panel/ShortcutGrid")
@export var bag_size = 24

func _ready():
    for i in range(bag_size):
        var slot = BagSlot.new()
        slot.init(Vector2(40,40))
        BagGrid.add_child(slot)
    for i in items_to_load.size():
        var item = BagItem.new()
        item.init(load(items_to_load[i]))
        $Panel/BagGrid.get_child(i).add_child(item)
    

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
                BagGrid.get_child(i).add_child(item)
                break
    else:
        for i in bag_size:
            if BagGrid.get_child(i).get_child_count() ==  0:
                BagGrid.get_child(i).add_child(item)
                break
                
func add_item_data(item) -> void: 
    if item.data.stackable:
        for i in bag_size:
            if BagGrid.get_child(i).get_child_count() > 0:
                if BagGrid.get_child(i).get_child(0).data == item.data:
                    BagGrid.get_child(i).get_child(0).data.count += item.data.count
                    BagGrid.get_child(i).get_child(0).get_child(0).text =  str(BagGrid.get_child(i).get_child(0).data.count)
                    item.queue_free()
                    break
            else:
                item.reparent(BagGrid.get_child(i))
                break
    else:
        for i in bag_size:
            if BagGrid.get_child(i).get_child_count() ==  0:
                item.reparent(BagGrid.get_child(i))
                break
                
func has_item_quantity(item_name):
    var quantity = 0
    for i in bag_size:
        if BagGrid.get_child(i).get_child_count() > 0:
            if BagGrid.get_child(i).get_child(0).data.item_name == item_name:
                quantity += BagGrid.get_child(i).get_child(0).data.count
    return quantity
    
func consume_item(item_name):
    for i in bag_size:
        if BagGrid.get_child(i).get_child_count() > 0:
            if BagGrid.get_child(i).get_child(0).data.item_name == item_name:
                if BagGrid.get_child(i).get_child(0).data.count == 1:
                    BagGrid.get_child(i).get_child(0).queue_free()
                else:
                    BagGrid.get_child(i).get_child(0).data.count -= 1


func _on_button_pressed():
    hide()

extends Node2D

var items = [
	load("res://resources/sprout_seed.tres"),
	load("res://resources/sunflower_seed.tres"),
	load("res://resources/ype_seed.tres"),
	load("res://resources/rose_seed.tres")
]

@onready var Grid = get_node("Background/ScrollContainer/GridContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(Grid.get_child_count()):
		Grid.get_child(i).get_node("tagname").text = items[i].item_name
		Grid.get_child(i).get_node("Price").text = str(items[i].price_buy)+"g"
		Grid.get_child(i).get_node("Description").text = items[i].description
		Grid.get_child(i).get_node("TextureRect").texture = items[i].item_texture
		Grid.get_child(i).get_node("TextureRect").expand_mode= TextureRect.EXPAND_IGNORE_SIZE
		Grid.get_child(i).get_node("TextureRect").stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	hide()


func _on_buy_pressed():
	if Money.money >= items[0].price_buy and Money.money != 0:
		Money.sub_money(items[0].price_buy)
		$"../Bag".add_item("sprout_seed")

func _on_buy_2_pressed():
	if Money.money >= items[1].price_buy and Money.money != 0:
		Money.sub_money(items[1].price_buy)
		$"../Bag".add_item("sunflower_seed")


func _on_buy_3_pressed():
	if Money.money >= items[2].price_buy and Money.money != 0:
		Money.sub_money(items[2].price_buy)
		$"../Bag".add_item("ype_seed")

func _on_buy_4_pressed():
	if Money.money >= items[3].price_buy and Money.money != 0:
		Money.sub_money(items[3].price_buy)
		$"../Bag".add_item("rose_seed")

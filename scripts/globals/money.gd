extends Node

var money: int = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_money(money_to_add):
	money += money_to_add

func sub_money(money_to_add):
	money -= money_to_add

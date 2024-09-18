extends Node2D

var items = [
	load("res://resources/flower_1_seed.tres")
]
# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/ScrollContainer/GridContainer.columns = items.size()
	for i in range(items.size()):
		var card = CropCard.new()
		card.init(items[i])
		$Background/ScrollContainer/GridContainer.add_child(card)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

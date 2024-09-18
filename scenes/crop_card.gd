class_name CropCard
extends Panel

@export var data: ItemData
# Called when the node enters the scene tree for the first time.
	

func _ready():
	if data:
		$Name.text = data.item_name
		$Price.text = data.price_buy
		$Description.text = data.description
		$TextureRect.texture = data.item_texture
		$TextureRect.expand_mode= TextureRect.EXPAND_IGNORE_SIZE
		$TextureRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

func init(d: ItemData) -> void:
	data = d

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buy_pressed():
	pass # Replace with function body.

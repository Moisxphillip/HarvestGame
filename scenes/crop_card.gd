extends Panel
var data: ItemData
# Called when the node enters the scene tree for the first time.
	

func fill(d: ItemData) -> void:
	data = d
	$tagname.text = data.item_name
	$Price.text = data.price_buy
	$Description.text = data.description
	$TextureRect.texture = data.item_texture
	$TextureRect.expand_mode= TextureRect.EXPAND_IGNORE_SIZE
	$TextureRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
func _on_buy_pressed():
	pass # Replace with function body.

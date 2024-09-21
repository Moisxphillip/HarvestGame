extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_shop_button_pressed():
    $Shop.visible = !$Shop.visible 
    if $Shop.visible and $Bag.visible:
        $Bag.visible = false


func _on_bag_button_pressed():
    $Bag.visible = !$Bag.visible 
    if $Shop.visible and $Bag.visible:
        $Shop.visible = false

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $HowToPlay.visible = false
    pass # Replace with function body.


func _on_start_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/stage.tscn")


func _on_how_to_play_pressed() -> void:
    $PanelContainer.visible = false
    $HowToPlay.visible = true


func _on_quit_pressed() -> void:
    get_tree().quit()


func _on_close_how_pressed() -> void:
    $PanelContainer.visible = true
    $HowToPlay.visible = false
    pass # Replace with function body.

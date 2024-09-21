extends Node3D

func _ready() -> void:
	$Music.play()
	Hud.start()



func _on_tree_exiting() -> void:
	$Music.stop()

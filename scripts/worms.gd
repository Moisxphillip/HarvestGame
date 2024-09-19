extends Node3D

@onready var an1 = $pest_bug/Animation
@onready var an2 = $pest_bug2/Animation
@onready var an3 = $pest_bug3/Animation

var active : bool = false

func activate()->void:
    active=true
    an1.play("Idle")
    an2.play("Idle")
    an3.play("Idle")
    
func kill()->void:
    active=false
    an1.play("Hide")
    an2.play("Hide")
    an3.play("Hide")
    

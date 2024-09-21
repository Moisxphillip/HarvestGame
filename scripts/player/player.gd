class_name Player
extends CharacterBody3D


const JUMP_VELOCITY = 4.5
@onready var mesh = $harvester
#@onready var animation = $Mesh/Animation
@onready var animation2 = $harvester/AnimationPlayer
@onready var wateranim = $harvester/watering_can/Animation
@onready var interaction = $harvester/Interaction
@onready var smachine = $StateMachine

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
    if not is_on_floor():
        velocity.y -= gravity * delta

    #if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        #velocity.y = JUMP_VELOCITY
    move_and_slide()

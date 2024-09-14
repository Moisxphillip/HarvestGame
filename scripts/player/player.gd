extends CharacterBody3D


const JUMP_VELOCITY = 4.5
@onready var mesh = $Mesh
@onready var mesh2 = $harvester_v2
@onready var animation = $Mesh/Animation
@onready var animation2 = $harvester_v2/AnimationPlayer
@onready var interaction = $harvester_v2/Interaction
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
    if not is_on_floor():
        velocity.y -= gravity * delta

    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY
    move_and_slide()

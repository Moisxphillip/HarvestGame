extends State

func enter(_msg := {}) -> void:
    entity.animation.play("Idle")

func handle_input(_event: InputEvent) -> void:
    var type = 0
    if Input.is_action_just_pressed("1"):
        type=1
    elif Input.is_action_just_pressed("2"):
        type=2
    elif Input.is_action_just_pressed("3"):
        type=3
    if type != 0 or Input.is_action_just_pressed("Interact") and entity.interaction.is_colliding():
        transition_to("Interact",{"type":str(type)})
        return
        
    var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
    var direction = (entity.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        transition_to("Walk")
      

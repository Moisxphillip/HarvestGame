extends State

func enter(_msg := {}) -> void:
    entity.animation2.play("Idle")
    #entity.animation2.pause()

func update(_delta: float) -> void:
    if Hud.is_interacting(): #can't move or do shit if interacting
        return
    
    if Input.is_action_just_pressed("Interact") and entity.interaction.is_colliding():
        transition_to("Interact")
        return
        
    var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
    var direction = (entity.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        transition_to("Walk")
      

extends State


var walkSpeed : float = 3.0
#var current_direction : Vector2 = Vector2.RIGHT #init player facing direction
var angularAccel = 0.08

func _ready() -> void : #TODO if speed change during playthrough in future, switch this to the enter function 
    #runSpeed = entity.runSpeed
    pass


func enter(_msg := {}) -> void:
    #if _msg.has("moveDirection"):
        #move(_msg["moveDirection"]*walkSpeed) 
    entity.animation.play("Walking_A")


func handle_input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("Interact") and entity.interaction.is_colliding():
        entity.velocity.x = move_toward(entity.velocity.x, 0, walkSpeed)
        entity.velocity.z = move_toward(entity.velocity.z, 0, walkSpeed)
        transition_to("Interact")
        return
    
    var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
    var direction = (entity.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        entity.velocity.x = direction.x * walkSpeed
        entity.velocity.z = direction.z * walkSpeed
        entity.mesh.rotation.y = lerp_angle(entity.mesh.rotation.y, atan2(direction.x, direction.z),angularAccel)
        return
      
    entity.velocity.x = move_toward(entity.velocity.x, 0, walkSpeed)
    entity.velocity.z = move_toward(entity.velocity.z, 0, walkSpeed)
    transition_to("Idle")
    

#
#func move(velocityX: float) -> void:
    ##entity.velocity.x = velocityX
    #if velocityX < 0.0 and !entity.sprite.flip_h:
        ##entity.atkHitBox.position.x = -atkPos
        ##entity.ambientQuery.rotation = PI
        ##entity.sprite.set_flip_h(true)
    ##elif velocityX > 0.0 and entity.sprite.flip_h:
        ##entity.atkHitBox.position.x = atkPos
        ##entity.ambientQuery.rotation = 0.0
        #entity.sprite.set_flip_h(false)

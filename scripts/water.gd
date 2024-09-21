extends State


func enter(_msg := {}) -> void:
    #entity.animation.play("Interact")
    entity.animation2.play("Watering")
    entity.wateranim.play("Water")
    $WaterAudio.play()
                

func update(_delta: float) -> void:
    if not entity.animation2.is_playing():
        transition_to("Idle")

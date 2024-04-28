extends State


func enter(_msg := {}) -> void:
    entity.animation.play("Interact")

func update(_delta: float) -> void:
    if not entity.animation.is_playing():
        transition_to("Idle")

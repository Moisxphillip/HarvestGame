extends State


func enter(_msg := {}) -> void:
    #entity.animation.play("Interact")
    $InteractAudio.play()
    entity.animation2.play("Grab")
    var plot : SoilPlot = entity.interaction.get_collider()
    if plot != null:
        Hud.interact(entity, plot)
                

func update(_delta: float) -> void:
    if not entity.animation2.is_playing():
        transition_to("Idle")

extends State


func enter(_msg := {}) -> void:
    entity.animation.play("Interact")
    var plot : SoilPlot = entity.interaction.get_collider()
    if plot != null:
        plot.interact(_msg["type"])

        

func update(_delta: float) -> void:
    if not entity.animation.is_playing():
        transition_to("Idle")

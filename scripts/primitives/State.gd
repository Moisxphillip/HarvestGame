@icon("res://addons/icons/State.svg")
class_name State
extends Node

@onready var entity = get_parent().get_parent()
signal switch_state(targetState: String, _forwardData: Dictionary)
    
func handle_input(_event: InputEvent) -> void:
    pass

func update(_delta: float) -> void:
    pass

func phys_update(_delta: float) -> void:
    pass

#The forwardData parameter is a dictionary with data that may be useful for initializing state
func enter(_forwardData := {}) -> void:
    pass

#Called before changing the active state, to clean up the current state.
func exit() -> void:
    pass
    
func damaged_by(_hitBox : Area2D) -> void:
    pass

#Uses a signal to transition states instead of the old dependent reference
func transition_to(targetState: String, _forwardData: Dictionary = {}):
    emit_signal("switch_state", targetState, _forwardData)

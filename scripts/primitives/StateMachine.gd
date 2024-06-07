@icon("res://addons/icons/SMachine.svg")
class_name StateMachine
extends Node

signal transitioned(stateName)
@export var initialState := NodePath() #Path to the initial active state. Export to be able to pick the initial state in the inspector.
@onready var state: State = get_node(initialState) #The current active state. At the start of the game, we get the `initial_state`.


func _ready() -> void:
    await owner.ready
    for child in get_children():
        child.switch_state.connect(on_switch_state)
    if state:
        state.enter()


func _unhandled_input(event: InputEvent) -> void:
    if state:
        state.handle_input(event)


func _process(delta: float) -> void:
    if state:
        state.update(delta)


func _physics_process(delta: float) -> void:
    if state:
        state.phys_update(delta)


func damaged_by(_hitBox : Area2D) -> void :
    if state:
        state.damaged_by(_hitBox)
    

func on_switch_state(targetState: String, _forwardData: Dictionary) -> void:
    if not has_node(targetState):
        print("StateMachine::transition_to: Current StateMachine has no state ", targetState)
        return
    
    if !state or targetState == state.name:#Won't transition if there's no state or the new state is the same as the current
        return
    
    state.exit()
    state = get_node(targetState)
    print("Entering ",get_parent().name, "::", targetState, " state")#Debug message
    state.enter(_forwardData)
    emit_signal("transitioned", state.name)

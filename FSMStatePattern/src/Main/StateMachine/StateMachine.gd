class_name StateMachine
extends Node

signal state_changed(new_state)

export (NodePath) var initial_state_path := ""
export (NodePath) var state_label_path := ""
export (NodePath) var animator_path := ""
onready var initial_state := get_node(initial_state_path)
onready var state_label : Label = get_node(state_label_path)
onready var animator : AnimationPlayer = get_node(animator_path)

var state : Object
var previous_state : Object
var history := []


func _ready() -> void:
	#Set the initial state to the first child
	state = initial_state
	enter_state()


func transition_to(new_state: Object, msg: Dictionary = {}) -> void:
	history.append(state.name)
	state = new_state
	previous_state = state
	enter_state()


func back() -> void:
	if history.size() > 0:
		state = get_node(history.pop_back())
		enter_state()


func enter_state() -> void:
	#print("Entering state: ", state.name)
	state_label.text = state.name
	animator.play(str(state.name))
	#Give the new state to this state machine script
	state.state_machine = self
	state.enter()
	
#Route GameLoop function calls to
#Current state handler method if it exists
func _physics_process(delta: float) -> void:
	if state.has_method("physics_process"):
		state.physics_process(delta)


func _unhandled_input(event: InputEvent) -> void:
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)

tool
class_name StateMachine
extends Node

export (NodePath) var initial_state
export (NodePath) var animator_path
export (NodePath) var actor_path

onready var actor : KinematicBody2D = get_node(actor_path)
onready var animator : AnimationPlayer = get_node(animator_path)
onready var state : State = get_node(initial_state) setget set_state
onready var previous_state : State
onready var state_name : String = state.name


func _get_configuration_warning() -> String:
	var warnings := PoolStringArray()
	if not initial_state:
		warnings.append("%s is missing a initial state to work properly" % name)
	if not animator_path:
		warnings.append("%s is missing animation player or can use animated sprite but animations need to have the same name of the yours states." % name)
	return warnings.join("\n")


func _init() -> void:
	add_to_group("state_machine")


func _ready() -> void:
	if !Engine.is_editor_hint():
		yield(owner, "ready")
		if state.has_method("enter"):
			state.enter()


func _unhandled_input(event: InputEvent) -> void:
	if !Engine.is_editor_hint():
		if state == null:
			return
		if state.has_method("unhandled_input"):
			state.unhandled_input(event)


func _physics_process(delta: float) -> void:
	if !Engine.is_editor_hint():
		if state == null:
			return
		if state.has_method("physics_process"):
			state.physics_process(delta)


func change_to(new_state: String, msg: Dictionary = {}) -> void:
	if new_state == null:
		return
	
	if state.has_method("exit"):
		state.exit()
	
	#Get Old State
	previous_state = state
	#Get New State
	state = get_node(new_state)
	state_name = state.name
	if animator.has_animation(state_name):
		animator.play(state_name)
	if state.has_method("enter"):
		state.enter(msg)
	

func set_state(value: State) -> void:
	state = value
	state_name = state.name

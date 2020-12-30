class_name State
extends Node

onready var _parent : State = null

var state_machine : StateMachine

func _ready() -> void:
	yield(owner,"ready")
	_parent = get_parent() as State


func physics_process(delta) -> void:
	pass


func unhandled_input(event: InputEvent) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	pass
	

func exit() -> void:
	pass

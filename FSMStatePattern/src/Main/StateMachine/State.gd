class_name State
extends Node

onready var state_machine := get_state_machine(self)
onready var parent := get_parent()


func _ready() -> void:
	yield(owner,"ready")


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass
	
	
func enter(msg: Dictionary = {}) -> void:
	pass
	
	
func exit() -> void:
	pass


func change_to(new_state: String,msg: Dictionary = {}) -> void:
	state_machine.change_to(new_state, msg)


func get_state_machine(node: Node) -> Node:
	if node != null and not node.is_in_group("state_machine"):
		return get_state_machine(node.get_parent())
	return node

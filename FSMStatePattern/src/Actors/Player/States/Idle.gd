extends State


func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)


func physics_process(delta) -> void:
	_parent.physics_process(delta)
	if owner.is_on_floor() and _parent.get_move_direction().x != 0.0:
		state_machine.transition_to(_parent.get_node("Run"))
	elif not owner.is_on_floor():
		state_machine.transition_to(_parent.get_node("Jump"))


func enter(msg: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass

extends State


func physics_process(delta) -> void:
	if owner.is_on_floor():
		if _parent.get_move_direction().x == 0.0:
			state_machine.transition_to(_parent.get_node("Idle"))
	else:
		state_machine.transition_to(_parent.get_node("Jump"))
	_parent.physics_process(delta)


func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)


func enter(msg: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass

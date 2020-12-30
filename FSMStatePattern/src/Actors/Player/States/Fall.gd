extends State


func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)


func physics_process(delta) -> void:
	_parent.physics_process(delta)
	if owner.is_on_floor():
		var target_state := _parent.get_node("Idle") if _parent.get_move_direction().x == 0.0 else _parent.get_node("Run")
		state_machine.transition_to(target_state)


func enter(msg: Dictionary = {}) -> void:
	if _parent.direction.y == -1.0 and _parent.velocity.y >= 0.0:
		_parent.direction.y = 0.0


func exit() -> void:
	pass

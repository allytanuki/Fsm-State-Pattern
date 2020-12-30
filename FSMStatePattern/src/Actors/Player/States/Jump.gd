extends State


func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)
	if event.is_action_released("jump"):
		enter({cancel_jump = _parent.velocity})


func physics_process(delta) -> void:
	_parent.physics_process(delta)
	if owner.is_on_floor():
		var target_state := _parent.get_node("Idle") if _parent.get_move_direction().x == 0.0 else _parent.get_node("Run")
		state_machine.transition_to(target_state)
	if not owner.is_on_floor() and _parent.velocity.y > 0.0:
		state_machine.transition_to(_parent.get_node("Fall"))


func enter(msg: Dictionary = {}) -> void:
	_parent.enter(msg)
	_parent.direction.y = -1.0
	
	if "velocity" in msg:
		_parent.velocity = msg.velocity
	if "impulse" in msg:
		_parent.velocity.y = -_parent.speed.y
	if "cancel_jump" in msg:
		_parent.velocity.y -= _parent.velocity.y/2

func exit() -> void:
	pass

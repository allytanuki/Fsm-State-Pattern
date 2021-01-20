extends State


func unhandled_input(event: InputEvent) -> void:
	parent.unhandled_input(event)


func physics_process(delta: float) -> void:
	parent.physics_process(delta)
	
	if parent.direction.x != 0:
		change_to("Move/Run")
	elif not owner.is_on_floor():
		change_to("Move/Jump")
	
	
func enter(msg: Dictionary = {}) -> void:
	if "velocity" in msg:
		parent.velocity = msg.velocity
	
	
func exit() -> void:
	pass

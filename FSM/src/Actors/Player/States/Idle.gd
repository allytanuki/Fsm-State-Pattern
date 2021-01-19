extends State


func unhandled_input(event: InputEvent) -> void:
	parent.unhandled_input(event)


func physics_process(delta: float) -> void:
	parent.physics_process(delta)
	
	
func enter(msg: Dictionary = {}) -> void:
	if "velocity" in msg:
		parent.velocity = msg.velocity
	
	
func exit() -> void:
	pass

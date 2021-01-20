extends State


func unhandled_input(event: InputEvent) -> void:
	parent.unhandled_input(event)


func physics_process(delta: float) -> void:
	parent.physics_process(delta)
	
	if owner.is_on_floor():
		change_to("Move/Idle")
	
	
func enter(msg: Dictionary = {}) -> void:
	pass
	
	
func exit() -> void:
	pass
	

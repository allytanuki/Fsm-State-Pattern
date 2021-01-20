extends State


func unhandled_input(event: InputEvent) -> void:
	parent.unhandled_input(event)


func physics_process(delta: float) -> void:
	parent.physics_process(delta)
	
	if parent.velocity.y > 0.0:
		change_to("Move/Air")
	
func enter(msg: Dictionary = {}) -> void:
	pass
	
	
func exit() -> void:
	pass
	

func jump() -> void:
	if owner.is_on_floor():
		parent.velocity.y = -parent.jump_strenght


func cancel_jump() -> void:
	if not owner.is_on_floor() and parent.velocity.y < 0.0:
		parent.velocity.y -= parent.velocity.y/2


func _on_Feet_body_entered(body: Node) -> void:
	if body.is_in_group("Bounce"):
		parent.velocity.y = -body.stomp_impulse.y
		parent.velocity.x = body.stomp_impulse.x

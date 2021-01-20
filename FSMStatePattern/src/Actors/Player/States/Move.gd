extends State

const FLOOR_NORMAL := Vector2.UP

export (float) var move_speed := 800.0

var jump_height := 4.2 * 80
var jump_duration := .4

var gravity
var jump_strenght


var direction := Vector2.ZERO
var velocity := Vector2.ZERO


func unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		$Jump.jump()
		direction.y = 1.0

	elif event.is_action_released("jump"):
		$Jump.cancel_jump()


func physics_process(delta: float) -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	gravity = (2 * jump_height) / pow(jump_duration, 2)
	jump_strenght = gravity * jump_duration
	
	if direction.y == 1.0 and velocity.y >= 0.0:
		direction.y = 0.0
	
	var snap := Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	velocity = calculate_move_velocity(velocity, direction, move_speed)
	velocity = calculate_gravity(velocity,gravity,delta)
	velocity = owner.move_and_slide_with_snap(velocity, snap, FLOOR_NORMAL)
	
	check_bounce(delta)
	
	
func enter(msg: Dictionary = {}) -> void:
	pass
	
	
func exit() -> void:
	pass


func calculate_move_velocity(
		linear_velocity: Vector2,
		move_direction: Vector2,
		move_speed: float
	) -> Vector2:
	var out : = linear_velocity
	out.x = move_speed * move_direction.x
	return out


func calculate_gravity(
		linear_velocity: Vector2,
		gravity: float,
		delta: float
	) -> Vector2:
	var out : = linear_velocity
	out.y += gravity * delta
	return out


func check_bounce(delta: float) -> void:
	if velocity.y > 0.0:
		for raycast in owner.bounce_raycasts.get_children():
			raycast.cast_to = Vector2.DOWN * velocity * delta + Vector2.DOWN
			raycast.force_raycast_update()
			if raycast.is_colliding() and raycast.get_collision_normal() == Vector2.UP:
				velocity.y = (raycast.get_collision_point() - raycast.global_position - Vector2.DOWN).y / delta
				if raycast.get_collider().is_in_group("Bounce"):
					raycast.get_collider().entity.call_deferred("be_bounced_upon", self)
					break


func bounce(impulse: Vector2) -> void:
	velocity.y = -impulse.y
	velocity.x = impulse.x

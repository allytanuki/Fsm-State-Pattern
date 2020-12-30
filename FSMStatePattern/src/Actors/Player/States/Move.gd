extends State

const PASS_THROUGH := 1

export var speed := Vector2(500.0,1000.0)
export var gravity := 3500.0

onready var jump : State = $Jump

var direction := Vector2.ZERO
var velocity := Vector2.ZERO


func unhandled_input(event: InputEvent) -> void:
	if owner.is_on_floor() and event.is_action_pressed("jump"):
		state_machine.transition_to(jump)
		jump.enter({impulse = speed})
	if event.is_action_pressed("move_down") and  owner.is_on_floor():
		owner.set_collision_mask_bit(PASS_THROUGH, false)
		state_machine.transition_to(jump)
	elif event.is_action_pressed("move_down") and  owner.is_on_floor():
		owner.set_collision_mask_bit(PASS_THROUGH, true)


func physics_process(delta) -> void:
	velocity = calculate_velocity(velocity, speed, gravity, delta, get_move_direction())
	velocity = owner.move_and_slide(velocity, Vector2.UP)


func enter(msg: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass


static func calculate_velocity(
		old_velocity: Vector2,
		speed: Vector2,
		gravity: float,
		delta: float,
		move_direction: Vector2
	) -> Vector2:
	var new_velocity := old_velocity
	
	new_velocity.x = speed.x * move_direction.x
	new_velocity.y += gravity * delta
	
	
	return new_velocity


static func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		1.0
	)

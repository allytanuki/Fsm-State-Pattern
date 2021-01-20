extends Node2D
class_name Bumper

export (Vector2) var stomp_impulse := Vector2.ZERO


func be_bounced_upon(bouncer: Node) -> void:
	if bouncer.has_method("bounce"):
		bouncer.bounce(stomp_impulse)
		boing()


func boing() -> void:
	$AnimationPlayer.play("Boing")

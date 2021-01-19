extends Area2D


func _ready() -> void:
	connect("body_entered", self,"_on_body_entered")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		Game.check_point.global_position = global_position
		queue_free()

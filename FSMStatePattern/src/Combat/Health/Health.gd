extends Node
class_name Health

signal max_changed(new_max)
signal health_changed(new_value)
signal depleted

export (int) var max_health := 10 setget set_max
onready var current : int = max_health setget set_current


func _ready() -> void:
	initialize()


func initialize() -> void:
	emit_signal("max_changed",max_health)
	if current != null:
		emit_signal("health_changed",current)


func set_max(new_max: int) -> void:
	max_health = new_max
	max_health = max(1,max_health)
	emit_signal("max_changed",max_health)


func set_current(new_value: int) -> void:
	current = new_value
	current = clamp(current,0,max_health)
	emit_signal("health_changed",current)
	
	if current == 0:
		emit_signal("depleted")

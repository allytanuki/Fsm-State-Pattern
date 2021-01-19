extends Node

onready var tween : Tween = $Tween

var check_point : Position2D

func _ready() -> void:
	var checkpoints := get_tree().get_nodes_in_group("CheckPoint")
	for c in checkpoints:
		check_point = c

extends Area2D

export (NodePath) var entity_path := ".."
onready var entity : Node2D = get_node(entity_path)

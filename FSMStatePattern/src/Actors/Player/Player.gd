extends KinematicBody2D

onready var skin : Position2D = $Skin
onready var anim_play : AnimationPlayer = $Skin/AnimationPlayer

onready var bounce_raycasts : Node2D = $BounceRaycasts

onready var health : Node = $Health
onready var hurtbox : Area2D = $HurtBox
onready var duration : Timer = $StateMachine/Stagger/Duration


func _ready() -> void:
	hurtbox.connect("area_entered", $StateMachine/Stagger, "_on_HurtBox_area_entered")
	health.connect("depleted", $StateMachine/Stagger, "_on_Health_depleted")
	duration.connect("timeout", $StateMachine/Stagger, "_on_RecoverTimer_timeout")

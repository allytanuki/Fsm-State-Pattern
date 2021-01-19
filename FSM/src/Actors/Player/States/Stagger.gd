extends State


func _on_HurtBox_area_entered(area: Area2D) -> void:
	pass


func _on_Health_depleted() -> void:
	change_to("Die")


func _on_RecoverTimer_timeout() -> void:
	pass

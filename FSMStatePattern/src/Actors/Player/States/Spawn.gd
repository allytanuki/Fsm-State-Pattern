extends State


func _on_Player_animation_finished(anim_name: String) -> void:
	change_to("Move/Idle", { velocity = Vector2.ZERO})
	owner.health.current += 10


func enter(msg: Dictionary = {}) -> void:
	if "respawn" in msg:
		$RespawnTimer.wait_time = msg.respawn
	owner.anim_play.play("Spawn")
	owner.anim_play.connect("animation_finished", self,"_on_Player_animation_finished")
	owner.global_position = Game.check_point.global_position
	
	
func exit() -> void:
	owner.anim_play.disconnect("animation_finished", self,"_on_Player_animation_finished")

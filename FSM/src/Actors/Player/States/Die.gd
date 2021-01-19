extends State

export (float) var respawn_time := 1.0


func _on_Player_animation_finished(anim_name: String) -> void:
	change_to("Spawn", { respawn = respawn_time})


func enter(msg: Dictionary = {}) -> void:
	owner.anim_play.connect("animation_finished", self,"_on_Player_animation_finished")
	
	
func exit() -> void:
	owner.anim_play.disconnect("animation_finished", self,"_on_Player_animation_finished")

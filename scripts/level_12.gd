extends Node2D

func _ready():
	$HUD.update_score()
	$HUD.update_lives()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$Platforms/Aufzug/AnimationPlayer.play("up")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var aufzug = $Platforms/Aufzug
		var anim_player = aufzug.get_node("AnimationPlayer")
		var anim = anim_player.get_animation("down")
		if anim != null:
			var track_idx = anim.find_track(".:position", Animation.TYPE_VALUE)
			if track_idx != -1:
				anim.track_set_key_value(track_idx, 0, aufzug.position)
				anim_player.play("down")

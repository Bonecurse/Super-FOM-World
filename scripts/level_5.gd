extends Node2D
var levelcoins = 0 

func lev_coin():
	levelcoins += 1
	$HUD.update_levelcoins(levelcoins,63)
	if levelcoins > 62:
		$TilesMap/Exit.visible = true 
		if is_instance_valid($TilesMap/Noexit):
			$TilesMap/Noexit.queue_free()
	
func _ready():
	$HUD.update_score()
	$HUD.update_lives()
	$Platforms/Platform/AnimationPlayer.play("move")
	$Platforms/Platform2/AnimationPlayer.play("move")
	$TilesMap/Exit.visible = false 
	$HUD.showcoins()

func _on_door_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var ziel = $Teleport/TeleportZiel.position
		body.position = ziel


func _on_door_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var ziel = $Teleport/TeleportZiel2.position
		body.position = ziel

func _on_area_2d_body_entered(body: Node2D) -> void:  # Aufzug
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


func _on_area_aufzug_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$Platforms/Aufzug2/AnimationPlayer.play("up")


func _on_area_aufzug_2_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var aufzug = $Platforms/Aufzug2
		var anim_player = aufzug.get_node("AnimationPlayer")
		var anim = anim_player.get_animation("down")
		if anim != null:
			var track_idx = anim.find_track(".:position", Animation.TYPE_VALUE)
			if track_idx != -1:
				anim.track_set_key_value(track_idx, 0, aufzug.position)
				anim_player.play("down")


func _on_exit_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

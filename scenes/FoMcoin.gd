extends Area2D
@onready var hud = get_tree().root.get_node("level/HUD")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var scene = get_tree().current_scene
		if scene.has_method("lev_coin"):
			scene.call("lev_coin")
		queue_free()
		hud.add_punkte(100)
		

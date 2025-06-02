extends Area2D
@onready var hud = get_tree().root.get_node("level_2/HUD")

func _on_body_entered(body):
	if body.is_in_group("Player"):
#		game_manager.add_point()
		queue_free()
		hud.add_punkte(100)
		

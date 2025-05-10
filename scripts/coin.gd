extends Area2D
@onready var game_manager: Node = %GameManager

 


func _on_body_entered(body):
	if body.is_in_group("Player"):
		game_manager.add_point()
		queue_free()

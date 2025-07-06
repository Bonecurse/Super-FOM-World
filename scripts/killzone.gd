extends Area2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.die()
	GameManager.life -= 1
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	print("Gestorben. Verbleibende Leben: " +str(GameManager.life))
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()

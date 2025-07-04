extends Node2D


	


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.play()
		$BoxAlt.hide()
		await $AudioStreamPlayer2D.finished
		queue_free()

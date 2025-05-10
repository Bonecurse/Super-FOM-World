extends Control

func _on_menu_button_pressed() -> void:
	Engine.time_scale = 1
	GameManager.life = 3
	get_tree().change_scene_to_file("res://scenes/levels.tscn")


func _on_menu_button_2_pressed() -> void:
	get_tree().quit(0)

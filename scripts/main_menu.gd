extends Control


func on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit(0)

extends Node2D

func _ready():
	$HUD.update_score()
	$HUD.update_lives()

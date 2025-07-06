extends Node2D

@export var coin_scene: PackedScene = preload("res://scenes/FOMcoin.tscn")
@onready var spawn_point = $SpawnPoint
@onready var sprite = $Coinbox

var used = false

func hit_from_below():
	if used:
		return
	used = true
	spawn_coin()
	$AudioStreamPlayer2D.play()
	sprite.texture = preload("res://assets/sprites/usedblock.png")  # falls du eine "leere" Version hast
	# Optional: Animation abspielen, wenn vorhanden
	if has_node("AnimationPlayer"):
		$AnimationPlayer.play("used")

func spawn_coin():
	var coin = coin_scene.instantiate()
	get_tree().current_scene.add_child(coin)
	coin.global_position = spawn_point.global_position
#	coin.global_position = spawn_point.global_position
#	get_tree().current_scene.call_deferred("add_child", coin)
	coin.call_deferred("pop_up")

func _on_area_2d_body_exited(body: Node2D) -> void:
	hit_from_below()

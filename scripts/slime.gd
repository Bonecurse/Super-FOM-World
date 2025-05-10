extends Node2D


const SPEED = 60
var direction = 1
@onready var ray_cast_2d_rechts: RayCast2D = $RayCast2D_rechts
@onready var ray_cast_2d_2_links: RayCast2D = $RayCast2D2_links
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta):
	if ray_cast_2d_2_links.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if ray_cast_2d_rechts.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	position.x += direction * SPEED * delta

extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
var cheat = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if GameManager.life < 1:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# Projekt -> Projekteinstellungen -> Eingabezuordnung um eigene Actions zu erstellen und Key Bindings
	if (Input.is_action_just_pressed("jump") and is_on_floor()) or (Input.is_action_just_pressed("jump") and cheat):
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite (Richtungswechsel)
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Animationen
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	if not is_on_floor():
		animated_sprite.play("jump")
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("quit_to_gameover"):
		get_tree().change_scene_to_file("res://scenes/levels.tscn")

	if Input.is_action_just_pressed("cheat_on_off"):
		if cheat:
			cheat = false
		else:
			cheat = true
			
	move_and_slide()

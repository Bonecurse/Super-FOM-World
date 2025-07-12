extends CharacterBody2D

const SPEED = 400
const JUMP_VELOCITY = -250.0
const LANDING_SOUND_THRESHOLD = 250.0  # Mindest-Fallgeschwindigkeit für Sound
var dead = false 

var cheat = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var was_on_floor = false  # Für Landungsgeräusch
var max_fall_speed = 0.0  # Höchste Fallgeschwindigkeit merken

func die() -> void:
	if dead:
		return 
	dead = true 
	animated_sprite.play("death")
	

func _physics_process(delta: float) -> void:
	if GameManager.life < 1:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
		return
		
	# Schwerkraft anwenden
	if not is_on_floor():
		velocity += get_gravity() * delta

		# Maximale Fallgeschwindigkeit merken
		if velocity.y > max_fall_speed:
			max_fall_speed = velocity.y

	# Springen
	if is_visible_in_tree() and not dead and  (Input.is_action_just_pressed("jump") and is_on_floor()) or (Input.is_action_just_pressed("jump") and cheat):
		$jumpsound.play()
		velocity.y = JUMP_VELOCITY

	if is_visible_in_tree() and not dead:
		# Eingabe-Richtung holen
		var direction := Input.get_axis("move_left", "move_right")
		
		# Sprite spiegeln
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

		# Bewegung anwenden
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# Szenewechsel bei Tastendruck
	if Input.is_action_just_pressed("quit_to_gameover"):
		get_tree().change_scene_to_file("res://scenes/levels.tscn")
		return 
		
	# Cheat-Toggle
	if Input.is_action_just_pressed("cheat_on_off"):
		cheat = not cheat

	# Bewegung ausführen
	move_and_slide()

	# LANDUNG ERKENNEN UND SOUND NUR BEI HOHEM FALL ABSPIELEN
	if is_on_floor() and not was_on_floor:
		if max_fall_speed > LANDING_SOUND_THRESHOLD:
			$landingsound.play()
		max_fall_speed = 0.0  # Zurücksetzen nach Landung

	# vorherigen Zustand speichern
	was_on_floor = is_on_floor()

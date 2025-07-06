extends Area2D
@onready var hud = get_tree().root.get_node("level/HUD")
@export var pop_height := 16      # Pixel nach oben
@export var pop_time   := 1    # Sek. für den Sprung
@export var auto_remove := true   # am Ende löschen?
@export var pop_offset := 16      # Pixel, um die der Startpunkt nach unten versetzt wird.



func _on_body_entered(body):
	if body.is_in_group("Player"):
		var scene = get_tree().current_scene
		if scene.has_method("lev_coin"):
			scene.call("lev_coin")
		$FomCoin64x64.hide()
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
			
		queue_free()
		hud.add_punkte(100)
		
func pop_up():
	# Safety: Methode nur starten, wenn Coin schon im Scene-Tree hängt
	if not is_inside_tree():
		await ready
	
	position.y += pop_offset

	var tween := create_tween()
	tween.tween_property(
		self, "position:y",
		position.y- pop_height,
		pop_time
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

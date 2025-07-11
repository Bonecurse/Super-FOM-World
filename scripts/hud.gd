extends CanvasLayer

# Punktestand (öffentlich zugänglich)

# Punkte erhöhen
func add_punkte(wert: int):
	GameManager.punkte += wert
	update_score()

# Punkte zurücksetzen
func reset_punkte():
	GameManager.punkte = 0

func update_score():
	%punkteanzeige.text = "SCORE: " + str(GameManager.punkte)

func update_lives():
	%lebenanzeige.text = "LIVES: " + str(GameManager.life)
	
func _on_ready() -> void:
	$levelcoins.visible = false 
 
func showcoins():
	$levelcoins.visible = true 

func update_levelcoins(ist,von):
	%levelcoins.text = "LEVELCOINS: " + str(ist) + " / " + str(von)

func _on_volume_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	ProjectSettings.set_setting("user/volume", value)
	ProjectSettings.save()
	
func _ready() -> void:
	var saved_volume = ProjectSettings.get_setting("user/volume", 0)
	if %VolumeSlider:
		%VolumeSlider.value = saved_volume
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, saved_volume)

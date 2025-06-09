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

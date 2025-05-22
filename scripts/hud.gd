extends CanvasLayer

# Punktestand (öffentlich zugänglich)
var punkte: int = 0

# Punkte erhöhen
func add_punkte(wert: int):
	punkte += wert
	update_score()

# Punkte zurücksetzen
func reset_punkte():
	punkte = 0

func update_score():
	print("SCORE: " + str(punkte))
	%punkteanzeige.text = "SCORE: " + str(punkte)

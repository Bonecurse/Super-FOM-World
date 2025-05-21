extends Node

# Punktestand (öffentlich zugänglich)
var punkte: int = 0

# Punkte erhöhen
func add_punkte(wert: int):
	punkte += wert

# Punkte zurücksetzen
func reset_punkte():
	punkte = 0

class_name Pelota


extends Node2D

var velocity := Vector2.ZERO

func stop() -> void:
	velocity = Vector2.ZERO
	rotation = 0
	print("pelota parada")

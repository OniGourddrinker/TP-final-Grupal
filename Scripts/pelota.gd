extends Node2D
@onready var _pelota = $Pelota

var velocity := Vector2.ZERO

func stop() -> void:
	_pelota.rotation = 0
	print("pelota parada")

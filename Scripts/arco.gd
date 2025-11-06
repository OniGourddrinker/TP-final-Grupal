class_name Arco

extends StaticBody2D

@onready var red := %AreaAdentro

func _ready() -> void:
	red.body_entered.connect(pelota_adentro.bind())
	

func pelota_adentro(pelota:Pelota) -> void:
	pelota.stop()

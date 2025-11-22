extends Node2D


@onready var ui_marcador = $scoreUI
@onready var player1 = $Player1
@onready var player2 = $Player_2
@onready var pelota0 = $Pelota
@onready var pelota = preload("res://Scenes/pelota.tscn")

var player_inicial
var player2_inicial
var pelota_inicial
var nueva_pelota
var score1 = 0
var score2 = 0
func _ready():
	player_inicial = player1.position
	player2_inicial = player2.position
	pelota_inicial = pelota0.global_position
	

func _process(_delta):
	if ui_marcador.player2_score != score2:
		score2 = ui_marcador.player2_score
		_Reiniciar_posicion()
	if ui_marcador.player1_score != score1:
		score1 = ui_marcador.player1_score
		_Reiniciar_posicion()
		
func _Reiniciar_posicion():
	player1.position = player_inicial
	player2.position = player2_inicial
	pelota0.queue_free()
	var nueva_pelota = pelota.instantiate()
	add_child(nueva_pelota)
	pelota0 = nueva_pelota
	pelota0.global_position = pelota_inicial

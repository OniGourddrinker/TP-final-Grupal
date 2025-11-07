extends Node2D

@onready var ui_marcador = $scoreUI
@onready var player1 = $Player1
@onready var player2 = $Player2
@onready var CPU = $CPUPlayer2
@onready var pelota = $Pelota
var player_inicial
var player2_inicial
var CPU_inicial
var pelo_inicial
var score1 = 0
var score2 = 0

func _ready():
	player_inicial = player1.position
	player2_inicial = player2.position
#	CPU_inicial = CPU.position
	pelo_inicial = pelota.position

func _process(delta):
	if (ui_marcador.player2_score != score2) or (ui_marcador.player1_score != score1):
		
		score1 = ui_marcador.player1_score
		score2 = ui_marcador.player2_score
		
		_Reiniciar_posicion()
		
func _Reiniciar_posicion():
	player1.position = player_inicial
	player2.position = player2_inicial
	#CPU.position = CPU_inicial
	pelota.position = pelo_inicial


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("FUERA")
	_Reiniciar_posicion()

extends Node2D

@onready var ui_marcador = $scoreUI
@onready var player1 = $Player1
@onready var player2 = $Player2
#@onready var CPU = $CPUPlayer2
@onready var pelotaN = $Pelota
@onready var pelota = get_node("Pelota/Pelota")
var player_inicial
var player2_inicial
var pelota_inicial
#var CPU_inicial
var score1 = 0
var score2 = 0

func _ready():
	player_inicial = player1.position
	player2_inicial = player2.position
	pelota_inicial = pelota.position
	print(pelota.position)
	#CPU_inicial = CPU.position
	

func _process(_delta):
	#Si el marcador de este codigo difiere del label:
	if ui_marcador.player2_score != score2:
		score2 = ui_marcador.player2_score
		_Reiniciar_posicion2()
	if ui_marcador.player1_score != score1:
		#Vuelvo a igualar los valores del label
		score1 = ui_marcador.player1_score
		#Y reinicio posiciones iniciales
		_Reiniciar_posicion1()
		
func _Reiniciar_posicion1():
	player1.position = player_inicial
	pelota.global_position = Vector2(0.0, 0.0)
	pelotaN.stop()
	
func _Reiniciar_posicion2():
	player2.position = player2_inicial
	pelota.global_position = Vector2(0.0, 0.0)
	pelotaN.stop()
	
	#CPU.position = CPU_inicial

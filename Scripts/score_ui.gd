extends Control

var player1_score = 0
var player2_score = 0
var game_time = 90
var time_left = game_time

@onready var timer_label = $timerLabel
@onready var score_label = $Label
@onready var game_timer = $GamerTimer
@onready var label_winner = $LabelWin

func _ready():
	update_score_display()
	start_timer()
	# Ocultar el label del ganador al inicio
	label_winner.visible = false

func _process(_delta):
	if game_timer.time_left > 0:
		time_left = game_timer.time_left
		update_timer_display()

func update_timer_display():
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]

func start_timer():
	game_timer.wait_time = game_time
	game_timer.start()

func update_score_display():
	$Label.text = "Player 1 - %d 
				Player 2 - %d" % [player1_score, player2_score]

func add_goal_player1():
	player1_score += 1
	update_score_display()

func add_goal_player2():
	player2_score += 1
	update_score_display()

func _on_gamer_timer_timeout():
	show_winner()

func show_winner():
	# Mostrar resultado final
	var winner_text = ""
	if player1_score > player2_score:
		winner_text = "¡PLAYER 1 GANA!"
	elif player2_score > player1_score:
		winner_text = "¡PLAYER 2 GANA!"
	else:
		winner_text = "¡EMPATE!"
	
	# Actualizar el label del marcador
	#score_label.text = "FIN DEL JUEGO\n%s\n%d - %d" % [winner_text, player1_score, player2_score]
	# Mostrar en el LABEL WINNER en pantalla
	label_winner.text = "FIN DEL JUEGO\n%s\n%d - %d" % [winner_text, player1_score, player2_score]
	label_winner.visible = true
	# PAUSAR JUEGO AL FINALIZAR TIEMPO
	get_tree().paused = true
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

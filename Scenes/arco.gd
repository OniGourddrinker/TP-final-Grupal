extends StaticBody2D

@onready var container_particulas = $particulas

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_adentro_body_entered(body):
	 # Primero solo ponemos esto para probar
	print("Algo entró al arco: ", body.name)
	print("Nombre de la escena actual:", get_tree().current_scene.name)
	# Si es la pelota (RigidBody2D)
	if body is RigidBody2D:
		print("1 GOL!")
		# Congelar la pelota
		body.freeze = true
		body.linear_velocity = Vector2.ZERO
		
		# Activar TODAS las partículas dentro del Node2D
		if container_particulas:
			for child in container_particulas.get_children():
				if child is CPUParticles2D:
					child.emitting = true
					print("Partículas activadas: ", child.name)
		
	# Sumar gol al PLAYER 2 (porque la pelota entró en arco del Player 1)
		var score_ui = get_node("/root/World/scoreUI")
		if score_ui:
			score_ui.add_goal_player2()
		else:
			print("ERROR: No se encontró ScoreUI")

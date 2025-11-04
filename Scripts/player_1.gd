
class_name Player

extends CharacterBody2D



enum ControlScheme {CPU, P1, P2}
enum State{MOVING, PASS}

@export var control_scheme : ControlScheme
@export var speed : float

@onready var player_sprite = %PlayerSprite

var heading := Vector2.RIGHT


func _physics_process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		pass
	else:
		human_movement()
	move_and_slide()
	set_heading()
	set_movement_animation()
	flip_sprite()

func human_movement() -> void:
	var direction := KeyUtils.get_input_vector(control_scheme)
	velocity = direction * speed


func set_movement_animation() -> void: 
	if velocity.length() > 0:
		player_sprite.play("run_x")
	else:
		player_sprite.play("idle")



func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT


func flip_sprite()-> void:
	if heading == Vector2.RIGHT:
		player_sprite.flip_h = false
	elif heading == Vector2.LEFT:
		player_sprite.flip_h = true
		
		
		
		
		
		



#	if Input.is_action_just_pressed("patada") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

#	var direction := Input.get_axis("izquierda", "derecha")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Agregue direccion en y para que pueda moverse arriba y abajo copiando el codigo de derecha izquierda
	#No recuerdo cual era la forma que lo hacia el profe
#	var directiony := Input.get_axis("arriba", "abajo")
#	if directiony:
#		velocity.y = directiony * SPEED
#	else:
#		velocity.y = move_toward(velocity.y, 0, SPEED)

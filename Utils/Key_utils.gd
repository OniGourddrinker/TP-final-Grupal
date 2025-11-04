extends Node
enum Action {LEFT, RIGHT, UP, DOWN, SHOOT}

const ACTIONS_MAP : Dictionary = {
	Player.ControlScheme.P1:{
		Action.LEFT: "izquierda",
		Action.RIGHT: "derecha",
		Action.UP: "arriba",
		Action.DOWN: "abajo",
		Action.SHOOT: "patada"
	},
	Player.ControlScheme.P2:{
		Action.LEFT: "p2_izquierda",
		Action.RIGHT:"p2_derecha",
		Action.UP: "p2_arriba",
		Action.DOWN: "p2_abajo",
		Action.SHOOT: "p2_patada"
	},
}
func get_input_vector(scheme: Player.ControlScheme) -> Vector2:
	var map : Dictionary = ACTIONS_MAP[scheme]
	return Input.get_vector(map[Action.LEFT], map[Action.RIGHT], map[Action.UP], map[Action.DOWN])
func is_action_pressed(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_pressed(ACTIONS_MAP[scheme][action])
	
func is_action_just_pressed(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_pressed(ACTIONS_MAP[scheme][action])
	
func is_action_just_released(scheme: Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_released(ACTIONS_MAP[scheme][action])

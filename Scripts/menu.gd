extends Control
func _ready() -> void:
	$VBoxContainer/EmpezarBoton.grab_focus()

func _on_empezar_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")



func _on_salir_boton_pressed() -> void:
	get_tree().quit()


func _on_cj_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/como_jugar.tscn")

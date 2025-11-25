extends CanvasLayer
class_name Menu

@onready var game = load(Globales.GAME)
@onready var options = load(Globales.OPTIONS)


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_packed(load(Globales.PANTALLA_CARGA))

func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_packed(load(Globales.OPTIONS))


func _on_salir_pressed() -> void:
	get_tree().quit()

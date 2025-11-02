extends CanvasLayer
class_name Menu

@export var juego : PackedScene
@export var opciones : PackedScene

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_packed(juego)


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_packed(opciones)


func _on_salir_pressed() -> void:
	get_tree().quit()

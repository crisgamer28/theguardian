class_name GameOverPanel
extends CanvasLayer

@export var scene_menu := preload(Globales.MENU_GAME)
@onready var reintentar: Button = $Control/VBoxContainer/Reintentar

func _on_reintentar_pressed() -> void:
	pass # Replace with function body.


func _on_volver_al_menú_pressed() -> void:
	get_tree().change_scene_to_packed(scene_menu)

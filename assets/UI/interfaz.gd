class_name Interfaz
extends CanvasLayer

@onready var barravida: TextureProgressBar = %Barravida
@onready var control: Control = $Control
@export var menu_escena : PackedScene
@onready var nueva_barra: TextureProgressBar = $TextureProgressBar


func _ready() -> void:
	control.visible = false
func actualizar_vida(vidas: int):
	barravida.value = vidas
	


func _on_menu_button_pressed() -> void:
	get_tree().paused = true
	control.visible = get_tree().paused


func _on_continue_pressed() -> void:
	get_tree().paused = false
	control.visible = false


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
	control.visible = false


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_packed(menu_escena)

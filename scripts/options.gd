extends Control

@export var menu : PackedScene

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_game.tscn")

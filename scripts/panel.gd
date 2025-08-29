extends CanvasLayer


func _on_try_pressed() -> void:
		get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menú.tscn")

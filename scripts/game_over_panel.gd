extends CanvasLayer

#func _input(event: InputEvent) -> void:
	#if Input.is_action_pressed("pause"):
		#visible = not visible

func _on_try_pressed() -> void:
		get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menú.tscn")


func _on_point_saved_pressed() -> void:
	pass

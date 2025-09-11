extends CanvasLayer

@export var scene_menu : PackedScene
#func _input(event: InputEvent) -> void:
	#if Input.is_action_pressed("pause"):
		#visible = not visible

#func _on_retry_button_pressed() -> void:
		#retry_button.get_tree().reload_current_scene()
		#options_button.get_tree().change_scene_to_file("res://Scenes/menú.tscn")


#func _on_options_button_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/menú.tscn")


#func _on_point_saved_pressed() -> void:
	#pass


func _on_retry_button_pressed() -> void:
	%RetryButton.get_tree().reload_current_scene()
	


func _on_options_button_pressed() -> void:
	%OptionsButton.get_tree().change_scene_to_packed(scene_menu)

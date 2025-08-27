extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		get_tree().reload_current_scene()
		print("Chocaste con un pincho!")
		

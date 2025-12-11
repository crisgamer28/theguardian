extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		change_scene()
		
func change_scene():
	get_tree().change_scene_to_packed(Globales.PUENTE)

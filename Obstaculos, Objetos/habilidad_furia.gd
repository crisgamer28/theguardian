extends Area2D
class_name Habilidad


func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.modulate = Color(1.409, 0.0, 0.498, 1.0)


func _on_visibility_changed() -> void:
	pass

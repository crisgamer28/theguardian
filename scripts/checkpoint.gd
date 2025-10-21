class_name Checkpoint
extends Area2D

var activated : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		activated = true
		Globales.ultimo_checkpoint = self
		$Polygon2D2.modulate = Color(0, 1, 0)
		print("Checkpoint!")

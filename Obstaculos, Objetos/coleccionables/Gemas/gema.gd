extends Pickup
class_name Gema

@export var vida_restablecida := 1





func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.curar()
		print("recuperaste vidas!!")
		queue_free()

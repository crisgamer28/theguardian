extends Pickup

func _ready() -> void:
	$AnimatedSprite2D.play("new_animation")


func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.entrar_furia()
		print("agarraste la habilidad")
		queue_free()

extends Area2D


@onready var anim: AnimatedSprite2D = $"../AnimatedSprite2D"


#func _on_body_entered(body: Node2D) -> void:
	#if body is Player1:
		#body.restar_vidas(1)
		#anim.play("attack")
#
#
#func _on_body_exited(body: Node2D) -> void:
	#anim.play("walk")

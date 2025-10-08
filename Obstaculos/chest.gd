extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var jugador: Player1 = null

func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		animated_sprite_2d.play("static")


func _on_body_exited(body: Node2D) -> void:
	if body == jugador:
		jugador = null
		animated_sprite_2d.play("close")
		



func _on_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.

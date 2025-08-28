extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

@export var damage := 5

func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.restar_vidas(damage)
		print("Chocaste con un pincho!")

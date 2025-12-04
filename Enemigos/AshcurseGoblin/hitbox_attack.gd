extends Area2D

var jugador : Player1
@onready var globin: CharacterBody2D = $".."





func _on_body_entered(body: Node2D) -> void:
	print("hola")
	globin.animacion.play("Attack")
	
	if body is Player1:
		%AnimationPlayer.play("animation_attack")
		body.restar_vidas(1)

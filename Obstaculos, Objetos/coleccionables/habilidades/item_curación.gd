extends Area2D


func _ready() -> void:
	$AnimatedSprite2D.play("curar")

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

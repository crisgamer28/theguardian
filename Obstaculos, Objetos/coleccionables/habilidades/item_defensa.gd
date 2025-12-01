extends Pickup
class_name Defensa

@onready var mensaje_habilidad: CanvasLayer = $MensajeHabilidad


func _ready() -> void:
	$AnimatedSprite2D.play("habilidad_defensa")


func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.entrar_defensa()
		mensaje_habilidad.visible = true
		print("agarraste la habilidad")
		queue_free()

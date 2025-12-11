extends Pickup

@onready var mensaje_habilidad2: CanvasLayer = $MensajeHabilidad2




func _ready() -> void:
	%AnimatedSprite2D.play("item_curar")




func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		mensaje_habilidad2.visible = true
		body.curarse()
		print("agarraste la habilidad")
		queue_free()
		

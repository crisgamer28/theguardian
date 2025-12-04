extends Pickup


func _ready() -> void:
	%AnimatedSprite2D.play("item_curar")
	
	


func _on_body_entered(body: Node2D) -> void:
	if body is Player1:
		print("algo")

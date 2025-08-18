extends Area2D
class_name Proyectil
@export var velocity := 300

func _process(delta: float) -> void:
	position.x += velocity * delta
	
func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	print("a")
	if body is Enemy:
		body.queue_free()
		queue_free()

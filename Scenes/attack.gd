extends Area2D

var daño : int = 1
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.take_damage(daño)
	monitoring = true

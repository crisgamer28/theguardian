extends Area2D
class_name Pickup

func spawn(vec : Vector2):
	monitoring = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", vec, 0.3)
	await get_tree().create_timer(0.3).timeout
	monitoring = true

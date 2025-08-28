extends Camera2D

@onready var player = get_parent().get_node(".")

func _process(delta: float) -> void:
	if player:
		global_position = player.global_position
	if player == null:
		global_position = Vector2(0, 0)

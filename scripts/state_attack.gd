extends StatePlayer
@onready var anim: AnimatedSprite2D = %AnimatedSprite2D



func on_enter():
	player.play_anim("attack player")
	player.direccion.x = 0
func player_process():
	if not anim.is_playing():
		state_manager.change_state("idle")
		


func _on_attack_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(1)

extends StatePlayer

var jump_velocity : int = -30

func _on_enter():
	player.anim_play("jump player")
	
	
func player_process():
	if player.direccion.y > 0:
		state_manager.change_state("idle")
	#elif Input.is_action_pressed("jump"):
		#player.direccion.y = jump_velocity
		

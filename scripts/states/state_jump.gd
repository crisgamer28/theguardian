extends StatePlayer
#<>
var jump_velocity : int = -30

func on_enter():
	player.play_anim("jump player")
	player.direccion.y = -1
	
func player_process():
	player.direccion.x = Input.get_axis("left", "right")
	player.direccion.y += player.gravedad
	if player.velocity.y >= 0:
		state_manager.change_state("falling")
	#elif Input.is_action_pressed("jump"):
		#player.direccion.y = jump_velocity
		

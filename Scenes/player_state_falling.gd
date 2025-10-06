extends StatePlayer


func on_enter():
	player.play_anim("jump player")

func player_process():
	player.direccion.y += 0.1
	if player.is_on_floor():
		state_manager.change_state("idle")

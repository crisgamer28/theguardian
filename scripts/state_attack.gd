extends StatePlayer

func on_enter():
	player.play_anim("attack player")

func player_process():
	if Input.get_axis("left", "right") != 0:
		state_manager.change_state("walk")

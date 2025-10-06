extends StatePlayer

func on_enter():
	player.play_anim("idle player")

func player_process():
	if Input.is_action_pressed("jump") and player.is_on_floor():
		state_manager.change_state("Jump")
		print("estoy saltando")
	elif not player.is_on_floor():
		state_manager.change_state("falling")
	if Input.get_axis("left", "right") != 0:
		state_manager.change_state("walk")

extends StatePlayer

func on_enter():
	player.play_anim("walk player")

func player_process():
	if not player.is_on_floor():
		state_manager.change_state("falling")
	player.direccion.x = Input.get_axis("left", "right")
	if player.velocity.x == 0:
		print("aaaaa")
		player.velocity.y = -1
	if player.direccion.x == 0:
		state_manager.change_state("idle")

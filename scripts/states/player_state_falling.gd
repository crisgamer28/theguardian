extends StatePlayer


func on_enter():
	player.play_anim("fall")

func player_process():
	#if Input.is_action_just_pressed("ataque"):
		#state_manager.change_state("attack")
	#if Input.is_action_just_pressed("defense"):
		#state_manager.change_state("defensa")
	if Input.is_action_just_pressed("ataque"):
		state_manager.change_state("attack")
	player.direccion.x = Input.get_axis("left", "right")
	player.direccion.y += player.gravedad
	if player.is_on_floor():
		state_manager.change_state("idle")

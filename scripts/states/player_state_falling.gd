extends StatePlayer


func on_enter():
	player.play_anim("fall")

func player_process():
	if Input.is_action_just_pressed("ataque"):
		state_manager.change_state("attack")
	player.direccion.y += player.gravedad
	if player.is_on_floor():
		state_manager.change_state("idle")

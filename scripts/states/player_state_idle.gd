extends StatePlayer

var jump_velocity = -30

func on_enter():
	player.direccion = Vector2.ZERO
	player.play_anim("idle player")

func player_process():
	if Input.is_action_just_pressed("defense"):
		state_manager.change_state("defensa")
	if Input.is_action_just_pressed("ataque"):
		state_manager.change_state("attack")
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_manager.change_state("Jump")
		#print("estoy saltando")
	if not player.is_on_floor():
		state_manager.change_state("falling")
	if Input.get_axis("left", "right") != 0:
		state_manager.change_state("walk")
	

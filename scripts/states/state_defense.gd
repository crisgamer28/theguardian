extends StatePlayer

func on_enter():
	player.play_anim("defense player")
	%Escudo.monitoring = true
	player.inmune = true
	print("entrando en defensa")
func on_exit():
	%Escudo.monitoring = false
	player.inmune = false
	print("saliendo de defensa")
func player_process():
	if Input.get_axis("left", "right") != 0:
		state_manager.change_state("walk")
	if Input.is_action_just_pressed("ataque"):
		state_manager.change_state("attack")
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_manager.change_state("Jump")

extends StatePlayer

func on_enter():
	player.play_anim("attack player")

func on_exit():
	$"../../Attack".monitoring = false

func player_process():
	$"../../Attack".monitoring = true
	player.direccion.x = Input.get_axis("left", "right")
	player.direccion.y += player.gravedad

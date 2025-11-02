extends DarkState

func on_enter():
	enemigo.play_animation("walk")
	print("esta patrullando")
func enemy_process():
	enemigo.patrulla()

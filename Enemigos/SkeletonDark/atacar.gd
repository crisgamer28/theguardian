extends DarkState




func on_enter():
	#enemigo.get_node("AnimationPlayer").play("ataque dark")
	enemigo.play_animation("attack")
	enemigo.velocity = Vector2.ZERO
func enemy_process():
	pass

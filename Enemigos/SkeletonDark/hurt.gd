extends DarkState

const HURT_DURATION = 0.5

func on_enter():
	enemigo.play_animation("hurt")
	enemigo.velocity = Vector2.ZERO
	await enemigo.get_tree().create_timer(HURT_DURATION).timeout
	
	if enemigo.player_in_range:
		enemigo.control_states.change_state("perseguir")
	else:
		enemigo.control_states.change_state("patrulla")
func enemy_process():
	pass
		
	

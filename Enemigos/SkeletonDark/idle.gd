extends DarkState


var direction = 1
var speed = 70

func on_enter():
	enemigo.play_animation("walk")
func enemy_process():
	var player_position = enemigo.player.global_position
	var enemigo_position = enemigo.global_position
	
	
	var direction = sign(player_position.x - enemigo_position.x)
	
	if direction == 1:
		enemigo.animated_sprite_2d.flip_h = false
	elif direction == -1:
		enemigo.animated_sprite_2d.flip_h = true
		
	enemigo.velocity.x = speed * direction
	enemigo.move_and_slide()

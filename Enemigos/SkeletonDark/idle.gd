extends DarkState


var direction = 1
var speed = 60
var attack_distance = 1

func on_enter():
	enemigo.play_animation("walk")
	#enemigo.velocity = Vector2.ZERO
func enemy_process():
	var player_position = enemigo.player.global_position
	var enemigo_position = enemigo.global_position
	
	#if is_instance_valid(enemigo.player):
		#var distance_to_player = enemigo.global_position.distance_to(enemigo.player.global_position)
		#if distance_to_player <= attack_distance:
			#enemigo.control_states.change_state("atacar")
			#return
	var direction = sign(enemigo.player.global_position.x - enemigo.position.x)
	

	if is_instance_valid(enemigo.player):
		var distance_to_player = enemigo.global_position.distance_to(enemigo.player.global_position)
		if distance_to_player <= attack_distance:
			enemigo.control_states.change_state("atacar")
	else:
			enemigo.control_states.change_state("patrulla")
	
	if direction == 1:
		enemigo.animated_sprite_2d.flip_h = false
	elif direction == -1:
		enemigo.animated_sprite_2d.flip_h = true

	enemigo.velocity.x = speed * direction
	enemigo.move_and_slide()

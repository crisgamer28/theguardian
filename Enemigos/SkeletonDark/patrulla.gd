extends DarkState

var direction = 1
var speed = 50



func on_enter():
	enemigo.play_animation("walk")
	print("esta patrullando")
func enemy_process(): 
	enemigo.velocity.x = speed * direction
	
	#deteccion suelo
	if enemigo.leftray.is_colliding():
		direction = 1


	if enemigo.rightray.is_colliding():
		direction = -1


	if not enemigo.floordetection.is_colliding():
		direction = -1


	if direction == 1:
		enemigo.animated_sprite_2d.flip_h = false
		enemigo.flip()
	elif direction == -1:
		enemigo.animated_sprite_2d.flip_h = true
		enemigo.flip()
	
	enemigo.move_and_slide()

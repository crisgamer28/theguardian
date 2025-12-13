extends DarkState

var direction = 1
var speed = 50
var player : Player1


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
		
	if not enemigo.floordetection_2.is_colliding():
		direction = 1


	if direction == 1:
		enemigo.animated_sprite_2d.flip_h = false
		enemigo.flip()
	elif direction == -1:
		enemigo.animated_sprite_2d.flip_h = true
		enemigo.flip()
	
	if enemigo.health == 0:
		enemigo.velocity = Vector2.ZERO
	
	enemigo.move_and_slide()

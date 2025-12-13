extends DarkState


func on_enter():
	enemigo.play_animation("die")
	enemigo.velocity = Vector2.ZERO
	
	enemigo.set_collision_mask_value(2, false)
	enemigo.hitbox_attack.monitoring = false
	enemigo.sensor.monitoring = false
	
	await enemigo.get_tree().create_timer(2.0).timeout
	
	enemigo.queue_free()
	
	
func enemy_process():
	pass

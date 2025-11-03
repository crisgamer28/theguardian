extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var suelo_1: RayCast2D = $suelo1
@onready var suelo_2: RayCast2D = $suelo2
@onready var pared_1: RayCast2D = $pared1
@onready var pared_2: RayCast2D = $pared2



var speed := 50
var damage := 1
var direction := 1



func _physics_process(delta: float) -> void:
	pass

func patrolling_movement():
	animated_sprite_2d.play("walk")
	velocity.x = direction * speed
# Girar sprite según movimiento
	#sprite2D.flip_h = velocity.x < 0
	#if direction > 0:
		#hitbox.position.x = abs(hitbox.position.x)
	#else:
		#hitbox.position.x = -abs(hitbox.position.x)
## Cambiar de dirección si no hay piso o hay pared
	#if not floor_limit.is_colliding() or left_limit.is_colliding() or right_limit.is_colliding():
		#direction *= -1 
		#var floor_pos = floor_limit.position
		#floor_pos.x *= -1
		#floor_limit.position = floor_pos
		#var right_pos = right_limit.position
		#var left_pos = left_limit.position
		#right_pos.x *= -1
		#left_pos.x *= -1
		#right_limit.position = right_pos
		#left_limit.position = left_pos

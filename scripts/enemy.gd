extends CharacterBody2D
class_name Enemy

@onready var hitbox = %HitboxSword
@onready var left_limit := $left
@onready var right_limit := $right
@onready var floor_limit := $floor
@onready var sprite2D := $Sprite2D
@onready var animationPlayer := $AnimationPlayer

@export var speed := 50
@export var damage := 1
@export var health = 2


var gravity : float = 25.0
var direction := 1
var last_position: Vector2 = Vector2.ZERO
var die_enemy : int = 1
var jugador = null

enum estados {patrulla, chase}
var current_states = estados.patrulla

func _ready():
	animationPlayer.play("walk")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	match current_states:
		estados.patrulla:
				velocity.x = direction * speed
	# Girar sprite según movimiento
				sprite2D.flip_h = velocity.x < 0
				if direction > 0:
					hitbox.position.x = abs(hitbox.position.x)
				else:
					hitbox.position.x = -abs(hitbox.position.x)
	# Cambiar de dirección si no hay piso o hay pared
				if not floor_limit.is_colliding() or left_limit.is_colliding() or right_limit.is_colliding():
					direction *= -1 
					var floor_pos = floor_limit.position
					floor_pos.x *= -1
					floor_limit.position = floor_pos
					var right_pos = right_limit.position
					var left_pos = left_limit.position
					right_pos.x *= -1
					left_pos.x *= -1
					right_limit.position = right_pos
					left_limit.position = left_pos
		estados.chase:
			if Player1 != null:
				var direction_to_player = sign(jugador.global_position.x - global_position.x)
				velocity.x = direction_to_player * speed
				sprite2D.flip_h = velocity.x < 0
				if direction > 0:
					hitbox.position.x = abs(hitbox.position.x)
				else:
					hitbox.position.x = -abs(hitbox.position.x)
	move_and_slide()
	last_position = position
func take_damage(amount : int):
	health -= amount
	animationPlayer.play("hurt")
	await animationPlayer.animation_finished
	_ready()
	if 0 >= health:
		die()

func die():
	%HitboxSword.queue_free()
	%Hitboxnormal.queue_free()
	%Sensor.queue_free()
	set_physics_process(false)
	animationPlayer.play("die")
	await animationPlayer.animation_finished
	queue_free() 

#esta funcion hace que el enemigo ejecute ataque al player
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.restar_vidas(damage)
		animationPlayer.play("attack1")
		

#esta funcion hace que finalice el ataque y vuelva al estado walk
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack1":
		animationPlayer.play("walk")
		



func _on_sensor_body_entered(body: Node2D) -> void:
	if body is Player1:
		jugador = body
		current_states = estados.chase
func _on_sensor_body_exited(body: Node2D) -> void:
	if body == jugador:
		jugador = null
		current_states = estados.patrulla

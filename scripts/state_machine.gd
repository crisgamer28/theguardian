extends Node

@onready var player1 = get_parent()
enum States { idle, walk, jump, attack, defense, die }
var state : int = States.idle
@onready var sprite: AnimatedSprite2D = %AnimatedSprite2D


func update_state():
	if Input.is_action_pressed("defense"):
		change_states(States.defense)
	if state == States.defense:
		return
	if Input.is_action_just_pressed("ataque"):
		change_states(States.attack)
		$"../Area2D"
	if state == States.attack:
		return
	if not player1.is_on_floor():
		change_states(States.jump)
	elif player1.velocity.x != 0:
		change_states(States.walk)
	else:
		change_states(States.idle)
		
func change_states(new_state : int) -> void:
	if state == new_state:
			return
	state = new_state
	match state:
		States.idle : sprite.play("idle player")
		States.walk : sprite.play("walk player")
		States.jump : sprite.play("jump player")
		States.attack : sprite.play("attack player")
		States.defense : sprite.play("defense player")
		States.die : 
			sprite.play("die player")
			player1.velocity = Vector2.ZERO
	#if sprite.is_playing():
		#await sprite.animation_finished
func _on_animated_sprite_2d_animation_finished() -> void:
	if state == States.attack:
		change_states(States.idle)
	if state == States.defense:
		change_states(States.idle)

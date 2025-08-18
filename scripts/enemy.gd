extends CharacterBody2D
class_name Enemy

@onready var hitbox = $Hitbox
@onready var left_limit := $left
@onready var right_limit := $right
@onready var floor_limit := $floor
@onready var sprite2D := $Sprite2D
@onready var animationPlayer := $AnimationPlayer

@export var speed := 50
@export var damage := 1
@export var vidas = 1

var gravity : float = 25.0
var direction := 1
var last_position: Vector2 = Vector2.ZERO

func _ready():
	animationPlayer.play("walk")

func _physics_process(delta: float) -> void:
	velocity.x = direction * speed

	# Girar sprite según movimiento
	sprite2D.flip_h = velocity.x < 0
	
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
	move_and_slide()
	last_position = position

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.restar_vidas(damage)
		animationPlayer.play("attack1")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack1":
		animationPlayer.play("walk")

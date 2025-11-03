extends CharacterBody2D
class_name SkeletonDark

@onready var control_states: StateManager  = $ControlStates
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox_attack: Area2D = $HitboxAttack
@onready var sensor: Area2D = $Sensor
@onready var leftray: RayCast2D = $Leftray
@onready var rightray: RayCast2D = $Rightray
@onready var floordetection: RayCast2D = $floordetection
@onready var floordetection_2: RayCast2D = $floordetection2

#@export var patrulla : bool = false
@export var health : int = 10
@export var daño : int = 1
var speed = 50
var gravity = 200
var direction := 1

func play_animation(anim: String):
	animated_sprite_2d.play(anim)
func _ready() -> void: 
	control_states.change_state("patrulla")
	

func _physics_process(delta: float) -> void:
	control_states.current_state.enemy_process()
	if not is_on_floor():
		velocity = get_gravity() * delta
	velocity.x = direction * speed 
	
	flip()
	move_and_slide()



func flip():
	animated_sprite_2d.flip_h = direction < 0 
	if velocity.x > 0:
		hitbox_attack.position.x = abs(hitbox_attack.position.x)
	else:
		hitbox_attack.position.x = -abs(hitbox_attack.position.x)

func patrulla():
	if leftray.is_colliding():
		direction = 1
	if rightray.is_colliding():
		direction = -1
	if not floordetection.is_colliding():
		direction *= -1
	if not floordetection.is_colliding():
		direction *= 1


func tomar_daño(amount : int):
	pass

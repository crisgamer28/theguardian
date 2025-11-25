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
var direction = 1


func play_animation(anim: String):
	animated_sprite_2d.play(anim)
func _ready() -> void: 
	control_states.change_state("patrulla")

func _physics_process(delta: float) -> void:
	control_states.current_state.enemy_process()
	if not is_on_floor():
		velocity = get_gravity() * delta
	velocity.x = speed * direction
	patrulla()
	flip()
	move_and_slide()


func flip():
	animated_sprite_2d.flip_h = velocity.x < 0 
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
	health -= amount
	animated_sprite_2d.play("hurt")
	if health <= 0:
		morir()
		
func morir():
	animated_sprite_2d.play("die")
	direction = false
	await get_tree().create_timer(1.0).timeout
	hitbox_attack.monitoring = false
	queue_free()


#func _on_body_entered(body: Node2D) -> void:
	#print("entró el jugador")
	#if player != null:
		#var direction_to_player = sign(player.global_position.x - global_position.x)
		#velocity.x = direction_to_player * speed * direction
		#animated_sprite_2d = player.velocity.x < 0
#func _on_body_exited(body: Node2D) -> void:
	#player = null
	#print("salio")

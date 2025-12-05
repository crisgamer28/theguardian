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
@export var health : int = 5
@export var daño : int = 1
var daño_aplicado = false


var speed = 50
var gravity = 100
var direction = 1
var player : Player1 = null
var player1 : Player
var player_in_range = false

func play_animation(anim: String):
	animated_sprite_2d.play(anim)
func _ready() -> void: 
	control_states.change_state("patrulla")

func _physics_process(delta: float) -> void:
	control_states.current_state.enemy_process()
	if not is_on_floor():
		velocity = get_gravity() * delta * 30
	patrulla()
	flip()



func flip():
	#animated_sprite_2d.flip_h = velocity.x < 0 
	if velocity.x > 0:
		hitbox_attack.position.x = abs(hitbox_attack.position.x)
	else:
		hitbox_attack.position.x = -abs(hitbox_attack.position.x)

func patrulla():
	pass


func tomar_daño(amount : int):
	animated_sprite_2d.play("hurt")
	await get_tree().create_timer(0.7).timeout
	health -= amount
	print(health)
	if health <= 0:
		morir()
	else:
		control_states.change_state("atacar")


func morir():
	animated_sprite_2d.play("die")
	await get_tree().create_timer(1.0).timeout
	hitbox_attack.monitoring = false
	sensor.monitoring = false
	hitbox_attack.hide()
	
	queue_free()





	#print("entró el jugador")
	#if player != null:
		#var direction_to_player = sign(player.global_position.x - global_position.x)
		#velocity.x = direction_to_player * speed * direction
		#animated_sprite_2d = player.velocity.x < 0



func _on_sensor_body_entered(body: Node2D) -> void:
	if body is Player1:
		player_in_range = true
		player = body
		if player_in_range:
			control_states.change_state("perseguir")
		elif player_in_range:
			control_states.change_state("atacar")
		else:
			control_states.change_state("patrulla")
			
		
		
		#control_states.change_state("perseguir")
		
		#animated_sprite_2d.play("idle")


func _on_sensor_body_exited(body: Node2D) -> void:
	if body is Player1:
		player_in_range = false
		player = null
		control_states.change_state("patrulla")
		

#
func _on_hitbox_attack_body_entered(body: Node2D) -> void:
	velocity = Vector2.ZERO
	#animated_sprite_2d.play("attack")
	await get_tree().create_timer(1.0).timeout
	if body is Player1:
		%AnimationPlayer.play("ataque dark")
		body.restar_vidas(1)
	if health == 0:
		morir()
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ataque dark":
		#daño_aplicado = false
		pass
		


func _on_hitbox_attack_body_exited(body: Node2D) -> void: pass
	#hitbox_attack.monitoring = false
	#if player_in_range:
		#control_states.change_state("perseguir")
	#else:
			#control_states.change_state("patrulla")
			
			
			
	#print("atacó")
	#if body is Player1 and not daño_aplicado:
		#if control_states.change_state("atacar"):
			#body.restar_vidas(daño)
			#daño_aplicado = true
			#control_states.change_state("atacar")

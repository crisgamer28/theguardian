extends CharacterBody2D
class_name Enemy

@onready var hitbox = %HitboxSword
@onready var left_limit := $left
@onready var right_limit := $right
@onready var floor_limit := $floor
@onready var sprite2D := $Sprite2D
@onready var animationPlayer := $AnimationPlayer
@onready var sensor: Area2D = %Sensor
@onready var attack_sensor: Area2D = %AttackSensor

@export var nombre: String = "Esqueleto"
#@export var velocidad : bool = false
@export var speed := 50
@export var damage := 1
@export var health = 2
@export var patrolling : bool = false

#var hurt_anim := false
#var attacking := false

var gravity : float = 25.0
var direction := 1
var last_position: Vector2 = Vector2.ZERO
var objetivo: Node2D

enum Estados {
	PATRULLA = 0, 
	CHASE = 1,
	ATACANDO = 2,
	HERIDO = 3,
	MURIENDO = 4,
	IDLE = 5,
	}
	
var current_state = Estados.PATRULLA: set = _al_cambiar_de_estado

func _ready():
	chequear_estado()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	chequear_estado()
		
	match current_state:
		Estados.IDLE:
			return
		Estados.MURIENDO:
			return
			
		Estados.PATRULLA:
			if patrolling:
				patrolling_movement()
					
		Estados.ATACANDO:
			if not animationPlayer.is_playing():
				animationPlayer.play("attack1")
			
		Estados.CHASE:
			if objetivo != null:
				var direction_to_player = sign(objetivo.global_position.x - global_position.x)
				velocity.x = direction_to_player * speed
				sprite2D.flip_h = velocity.x < 0
				if velocity.x > 0:
					hitbox.position.x = abs(hitbox.position.x)
				else:
					hitbox.position.x = -abs(hitbox.position.x)
	
			move_and_slide()
	
	#last_position = position

	
func take_damage(amount : int):
	if current_state == Estados.MURIENDO:
		return
	
	current_state = Estados.HERIDO
	health -= amount
	print("%s recibió %d puntos de daño. Le quedan %d" % nombre, amount, health)
	
	if health <= 0:
		current_state = Estados.MURIENDO
		attack_sensor.monitoring = false
		%Sensor.hide()
		%AttackSensor.hide()
		%Hitboxnormal.hide()
	#current_state = Estados.PATRULLA


#esta funcion hace que el enemigo ejecute ataque al player
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player1:
		body.restar_vidas(damage)

#esta funcion hace que finalice el ataque y vuelva al estado walk
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack1":
		chequear_estado()
	if anim_name == "hurt":
		current_state = Estados.IDLE
		chequear_estado()
	if anim_name == "die":
		queue_free()

func patrolling_movement():
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

#
#func _on_sensor_body_entered(body: Node2D) -> void:
	#if body is Player1:
		#objetivo = body
		#current_state = Estados.CHASE
		#

func _on_sensor_body_exited(body: Node2D) -> void:
	if body is Player1 and objetivo is Player1:
		objetivo = null
		chequear_estado()


func _on_attack_sensor_body_entered(body: Node2D) -> void:
	if body is Player1:
		current_state = Estados.ATACANDO
		animationPlayer.play("attack")


func chequear_estado() -> void:
	if current_state == Estados.HERIDO:
		return
	if current_state == Estados.MURIENDO:
		return
	
	objetivo = detectar_jugador()
	
	if objetivo:
		var jugador_en_rango_de_ataque : bool = detectar_jugador_en_rango()
		
		if jugador_en_rango_de_ataque:
			current_state = Estados.ATACANDO # El jugador está en rango de ataque
		else:
			current_state = Estados.CHASE # El jugador esta cerca
	
	else:
		if patrolling:
			current_state = Estados.PATRULLA # No hay jugador cercano
		else:
			current_state = Estados.IDLE # No hay jugador cercano



func detectar_jugador_en_rango() -> bool:
	var cuerpos_cercanos: Array = attack_sensor.get_overlapping_bodies()
	
	for cuerpo: PhysicsBody2D in cuerpos_cercanos:
		if cuerpo is Player1:
			return true
	return false


func detectar_jugador() -> Player1:
	var cuerpos_cercanos: Array = sensor.get_overlapping_bodies()
	
	for cuerpo: PhysicsBody2D in cuerpos_cercanos:
		if cuerpo is Player1:
			return cuerpo
	return null


# No llamar esta funcion directamente
func _al_cambiar_de_estado(nuevo_estado: Estados):
	if current_state == nuevo_estado:
		return
		
	current_state = nuevo_estado
	match nuevo_estado:
		Estados.PATRULLA:
			animationPlayer.play("walk")
			
		Estados.CHASE:
			animationPlayer.play("walk")
			
		Estados.ATACANDO:
			animationPlayer.play("attack1")
			
		Estados.HERIDO:
			animationPlayer.play("hurt")
		
		Estados.IDLE:
			animationPlayer.play("idle")
		
		Estados.MURIENDO:
			animationPlayer.play("die")
			

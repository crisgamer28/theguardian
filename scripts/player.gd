class_name Player
extends CharacterBody2D

@export var vidas = 3

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animationPlayer := $AnimationPlayer
@onready var sprite2D := $Sprite2D
@export var snow_scene: PackedScene
@export var snow_offset := Vector2(0, -20)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("disparar"):
		disparar()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if position.y > 150:
		get_tree().reload_current_scene()  # Elimina al jugador (útil si mostrás un mensaje de Game Over)
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#deteccion
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("Area2D"):
			quitar_vida()
			
	move_and_slide()
	
	animations(direction)
	
	if direction ==1:
		sprite2D.flip_h = false
	elif direction == -1:
		sprite2D.flip_h = true
		
		
func quitar_vida(daño: int = 1):
	vidas -= daño
	print("Recibiste daño! vidas: ", vidas)
	if vidas <= 0:
		morir()
		
func morir():
	get_tree().reload_current_scene()
	#queue_free()
	print("Game Over")
		
	
func disparar():
	var disparo = snow_scene.instantiate()
	disparo.global_position = global_position
	get_tree().current_scene.add_child(disparo)
	var speed = 200
	
func animations(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("idle")
		else:
			animationPlayer.play("Run")
	else:
		if velocity.y<0:
			animationPlayer.play("Jump")
		elif velocity.y>0:
			animationPlayer.play("Fall")

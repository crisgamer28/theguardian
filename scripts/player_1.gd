extends CharacterBody2D
class_name Player1
@onready var state_machine = $StateMachine
const speed := 150.0
const JUMP_VELOCITY := -300
@export var vidas = 5

@onready var sprite: AnimatedSprite2D = %Anima

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if position.y > 400:
		get_tree().reload_current_scene()
	if direction != 0:
		sprite.flip_h = direction < 0
		
	#if not is_on_floor():
		#sprite.play("jump player")
	#elif direction != 0:
		#sprite.play("walk player")
	#else:
		#sprite.play("idle player")
	$StateMachine.update_state()
	move_and_slide()
	
func restar_vidas(daño: int = 1):
	vidas -= daño
	print("Recibiste daño! vidas: ", vidas)
	if vidas <= 0:
		morir()
		
func morir():
	get_tree().reload_current_scene()
	#queue_free()
	print("Game Over")

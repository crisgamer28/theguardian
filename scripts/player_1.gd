extends CharacterBody2D
class_name Player1
## Este es el jugador

@onready var state_machine = $StateMachine
const speed := 150.0
const JUMP_VELOCITY := -300
@export var vidas = 5


@onready var game_over_menu: CanvasLayer = %GameOverMenu
@onready var barravida: TextureProgressBar = %Barravida
@onready var sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var daño_player := 1
var delay_die : float = 0.3

var dead_anim_delay : float = 2.0 # Tiempo antes de que aparezca el menu game over

var checkpoint_position : Vector2 = Vector2.ZERO
var spawn_position : Vector2

@onready var attack: Area2D = $Attack


func _ready() -> void:
	spawn_position = global_position
	checkpoint_position = spawn_position


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
	if global_position.y > 800:
		respawn()
	if direction != 0:
		sprite.flip_h = direction < 0
		if direction > 0:
			attack.position.x = abs(attack.position.x)
		else:
			attack.position.x = -abs(attack.position.x)
	#if not is_on_floor():
		#sprite.play("jump player")
	#elif direction != 0:
		#sprite.play("walk player")
	#else:
		#sprite.play("idle player")
	$StateMachine.update_state()
	move_and_slide()
	
func restar_vidas(daño: int = 1): #permite bajar la vida del player
	vidas -= daño
	barravida.value = vidas
	print("Recibiste daño! vidas: ", vidas)
	if vidas <= 0:
		morir()

## Esta funcion se llama cuando el personaje muere
func morir():
	set_physics_process(false)
	sprite.play("die player")
	await sprite.animation_finished
	game_over_menu.show()



func respawn(): #esta funcion permite guardar el punto de guardado
	global_position = checkpoint_position


func _on_attack_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(daño_player)
		
		

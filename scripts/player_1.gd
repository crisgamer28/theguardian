extends CharacterBody2D
class_name Player1
## Este es el jugador

@onready var state_manager: Node = $StateManager

@onready var state_machine = $StateMachine
const speed := 150.0
const JUMP_VELOCITY := 300
var direccion : Vector2 = Vector2.ZERO

@export var vidas = 5: set = al_cambiar_vidas # estas son las vidas que van bajando y te moris si llega a 0
@export var VIDA_MAXIMA := 5 # este es el maximo de vida que tiene el jugador

@onready var interfaz: Interfaz = %Interfaz
@onready var sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var daño_player := 1
var delay_die : float = 0.3

var dead_anim_delay : float = 2.0 # Tiempo antes de que aparezca el menu game over

var spawn_position : Vector2

@onready var attack: Area2D = $Attack

signal personaje_murio
signal vidas_cambiadas

var gravedad = 0.05


func _ready() -> void:
	vidas_cambiadas.connect(interfaz.actualizar_vida)
	
	if Globales.ultimo_checkpoint:
		spawn_position = Globales.ultimo_checkpoint.global_position
	else:
		spawn_position = global_position


func _physics_process(delta: float) -> void:
	state_manager.current_state.player_process()

	if velocity.x != 0:
		sprite.flip_h = velocity.x < 0
		if velocity.x > 0:
			attack.position.x = abs(attack.position.x)
		else:
			attack.position.x = -abs(attack.position.x)

	velocity.x = direccion.x * speed
	velocity.y = direccion.y * JUMP_VELOCITY
	move_and_slide()

func play_anim(anim:String):
	sprite.play(anim)

func restar_vidas(daño: int = 1): #permite bajar la vida del player
	vidas -= daño
	print("Recibiste daño! vidas: ", vidas)


## Esta funcion se llama cuando el personaje muere
func morir():
	set_physics_process(false)
	sprite.play("die player")
	await sprite.animation_finished
	personaje_murio.emit()

func curar():
	vidas = VIDA_MAXIMA

func respawn(): #esta funcion permite guardar el punto de guardado
	set_physics_process(true)
	curar()
	sprite.play("idle player")
	
	global_position = spawn_position

func _on_attack_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(daño_player)


## Setter de las vidas
func al_cambiar_vidas(vida_nueva: int):
	vidas = vida_nueva
	vidas_cambiadas.emit(vidas)
	
	if 0 >= vidas:
		morir()
	

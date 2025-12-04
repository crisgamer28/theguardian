extends CharacterBody2D
class_name Player1
## Este es el jugador

@export var estadisticas: PlayerStats

@onready var state_manager: Node = $StateManager

@onready var state_mdachine = $StateMachine
const speed := 110.0
const JUMP_VELOCITY := 300
var direccion : Vector2 = Vector2.ZERO

@export_category("Vidas")
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


var furia : bool = false
var furia_duracion = 1.0
@export var efecto_rojo : ShaderMaterial 
@onready var timer: Timer = $Timer
@export var furia_adquirida = false
@export var defensa_adquirida = false


var curación = false

signal personaje_murio
signal vidas_cambiadas

var inmune : bool = false
var gravedad = 0.05
var velocidad_aumentada = 200
#func _input(event: InputEvent) -> void:
	#if Input.is_action_pressed("pause"):
		#interfaz._ready()


func _ready() -> void:
	timer.timeout.connect(_on_timeout)
	vidas_cambiadas.connect(interfaz.actualizar_vida)
	
	if Globales.ultimo_checkpoint:
		spawn_position = Globales.ultimo_checkpoint.global_position
	else:
		spawn_position = global_position
	interfaz.visible = true

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

func entrar_furia():
	furia_adquirida = true
#
func entrar_defensa():
	defensa_adquirida = true


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("fury") and furia_adquirida:
		timer.start(2.0)
		furia = true
		#print("algo se presionó")
		sprite.material = efecto_rojo
		#
func _on_timeout():
	furia = false
	sprite.material = null
	print("Timer has finished!")  

func play_anim(anim:String):
	sprite.play(anim)

func restar_vidas(daño: int = 1): #permite bajar la vida del player
	if inmune:
		print("esta bloqueando")
		return
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
		if furia == true:
			daño_player = 10
			body.take_damage(daño_player)
		else:
			daño_player = 1
			print(daño_player)
	if body is SkeletonDark:
		body.tomar_daño(daño_player)


## Setter de las vidas
func al_cambiar_vidas(vida_nueva: int):
	vidas = vida_nueva
	vidas_cambiadas.emit(vidas)
	
	if 0 >= vidas:
		morir()
		


func _on_escudo_body_entered(body: Node2D) -> void:
		if body is Enemy:
			pass

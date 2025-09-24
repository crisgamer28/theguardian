extends CharacterBody2D
class_name Skeleton

@onready var suelo_der: RayCast2D = $"suelo der"
@onready var suelo_izq: RayCast2D = $"suelo izq"
@onready var limite_izq: RayCast2D = $"limite izq"
@onready var limite_der: RayCast2D = $"limite der"

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var sprite_skeleton: Sprite2D = $"Sprite Skeleton"


var gravity : float = 10.0
var direction := 1
var last_position: Vector2 = Vector2.ZERO
var die_enemy : int = 1
var personaje: Player1 = null


@export var speed := 100
@export var damage := 1
@export var health = 2

enum states2 {idle, perseguir}
var estado_actual = states2.idle

func _ready() -> void:
	animation_player.play("idle white")
	
	
func _physics_process(delta: float) -> void:
	#if not is_on_floor():
		#velocity.y += get_gravity().y * delta
	#sprite_skeleton.flip_h = velocity.x < 0
	if direction > 0:
		$"Sprite Skeleton".flip_h = false
	if direction < 0:
		$"Sprite Skeleton".flip_h = true

	match estado_actual:
		states2.idle:
			animation_player.play("idle white")
			
		states2.perseguir:
			animation_player.play("walk white")
			
		estado_actual:
			if personaje != null:
				var dirección_a_jugador = sign(personaje.global_position.x - global_position.x)
				velocity.x = dirección_a_jugador * speed
				
	velocity.x = speed * delta
	last_position = position
	move_and_slide()
	


func _on_sensor_skeleton_body_entered(body: Node2D) -> void:
	if body is Player1:
		personaje = body
		estado_actual = states2.perseguir


func _on_sensor_skeleton_body_exited(body: Node2D) -> void:
	if body == personaje:
		personaje = null
		estado_actual = states2.idle

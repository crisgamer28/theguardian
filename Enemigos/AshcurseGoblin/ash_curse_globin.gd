extends CharacterBody2D

@onready var right: RayCast2D = $right
@onready var left: RayCast2D = $left
@onready var floor: RayCast2D = $floor
@onready var animacion: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox_attack: Area2D = $HitboxAttack
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var jugador_en_rango = false
var player1: Player1
var direction = 1

func _ready() -> void:
	animacion.play("idle")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = get_gravity() * delta
		
	move_and_slide()



func _on_sensor_body_entered(body: Node2D) -> void:
	if body is Player1:
		pass

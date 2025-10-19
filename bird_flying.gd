extends CharacterBody2D

var speed := 50
var direction : int = 1
var player : Player1 = null
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if player != null:
		var _direccion_a_jugador = sign(player.global_position.x - player.global_position.x).normalized()
	position.x = direction * speed

func anim_bird(anim:String):
	animation_player.play(anim)

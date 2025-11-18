extends Area2D

const gema = preload("uid://cdl3os1qg1pgv")
const moneda = preload("uid://dq02i0c36qo53")
const item = preload("uid://dmo10ppqn6sgl")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var jugador = null
var open = false
var pickups = [gema, moneda, item]



func _on_body_entered(body: Node2D) -> void:
	
	if body is Player1 and not open:
		pickups.shuffle()
		open = true
		#body = jugador
		animated_sprite_2d.play("open")
		var pick_up = item.instantiate()
		pick_up.monitoring = false
		add_child(pick_up)
		pick_up.spawn(Vector2(20, 0))
		monitoring = false
	#if jugador != null:
		#animated_sprite_2d.play("close")
		

func _on_body_exited(body: Node2D) -> void:
	if body is Player1:
		body = jugador
	#if jugador == null:
			#print("salio")
			#animated_sprite_2d.play("close")

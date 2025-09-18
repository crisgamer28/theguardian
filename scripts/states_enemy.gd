extends Node

@onready var enemy = get_parent()
enum Estados{chase}
var estados = Estados.chase
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var jugador = null
var estado_actual = Estados.chase

func actualizar_estado():
	pass

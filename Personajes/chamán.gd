extends CharacterBody2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamacion: Polygon2D = $Polygon2D
const BALLOON = preload("uid://q73c4dicnup3")
const DIALOGO_PRUEBA = preload("uid://ctan7bcod5tk2")

var is_player_close = false
func _ready() -> void:
	animation_player.play("idle")
	



func _on_hitbox_npc_area_entered(area: Area2D) -> void:
	if Player1:
		print("hola")
	if Player1 and Input.is_action_just_pressed("enter"):
		DialogueManager.show_dialogue_balloon(DIALOGO_PRUEBA)
	is_player_close = true
	exclamacion.visible = true


func _on_hitbox_npc_area_exited(area: Area2D) -> void:
	is_player_close = false
	exclamacion.visible = false

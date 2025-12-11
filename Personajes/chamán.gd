extends CharacterBody2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamacion: Sprite2D = $Exclamación
@onready var label: Label = $Label

const BALLOON = preload("uid://q73c4dicnup3")
const DIALOGO_PRUEBA = preload("uid://ctan7bcod5tk2")

var is_player_close = false
var dialogo_activo = false


func _ready() -> void:
	label.visible = false
	animation_player.play("idle")
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _process(delta: float) -> void:
	if Player1 and Input.is_action_just_pressed("interactuar") and not dialogo_activo:
		DialogueManager.show_dialogue_balloon(DIALOGO_PRUEBA, "start")

func _on_hitbox_npc_area_entered(area: Area2D) -> void:
	label.visible = true
	is_player_close = true
	exclamacion.visible = true

func _on_hitbox_npc_area_exited(area: Area2D) -> void:
	print("chau")
	is_player_close = false
	exclamacion.visible = false
	label.visible = false



func _on_dialogue_started(dialogue):
	dialogo_activo = true



func _on_dialogue_ended(dialogue):
	await get_tree().create_timer(0.2).timeout
	dialogo_activo = false

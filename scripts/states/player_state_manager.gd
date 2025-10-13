extends StateManager

@export var player : CharacterBody2D
@export var ataque : Area2D


func _ready() -> void:
	for state in states:
		state.player = player
		state.state_manager = self
		state_dic[state.state_name] = state

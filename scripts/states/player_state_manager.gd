extends StateManager

@export var player : CharacterBody2D
@export var timer : Timer

func _ready() -> void:
	for state in states:
		state.player = player
		state.state_manager = self
		state_dic[state.state_name] = state


func _on_animated_sprite_2d_animation_finished() -> void:
	if %AnimatedSprite2D.animation == "attack player":
		change_state("idle")

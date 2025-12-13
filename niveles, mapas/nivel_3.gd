extends Node2D

@onready var game_over_panel: GameOverPanel = $GameOverPanel
@onready var player_1: Player1 = $Player1

func _ready() -> void:
	game_over_panel.reintentar.pressed.connect(reiniciar_nivel)
	player_1.personaje_murio.connect(game_over_panel.show)
	get_tree().paused = false
func reiniciar_nivel():
	get_tree().reload_current_scene()


func _on_area_body_entered(body: Node2D) -> void:
	if body is Player1:
		pass

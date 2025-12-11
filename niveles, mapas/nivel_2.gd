extends Nivel
class_name Nivel2

@onready var player_1: Player1 = $Player1
@onready var game_over_panel: GameOverPanel = $GameOverPanel


func _ready() -> void:
	game_over_panel.reintentar.pressed.connect(reiniciar_nivel)
	player_1.personaje_murio.connect(game_over_panel.show)
	get_tree().paused = false
func reiniciar_nivel():
	get_tree().reload_current_scene()

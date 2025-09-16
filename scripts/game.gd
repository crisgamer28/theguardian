extends Node2D
#https://itch.io/queue/c/3904913/killer-plants?game_id=836667&password=


@onready var player_1: Player1 = $Player1
@onready var game_over_menu: GameOverPanel = %GameOverMenu



func _ready() -> void:
	game_over_menu.retry_button.pressed.connect(player_1.respawn)
	player_1.personaje_murio.connect(game_over_menu.show)

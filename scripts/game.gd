extends Node2D
#https://itch.io/queue/c/3904913/killer-plants?game_id=836667&password=
#https://nastanliev.itch.io/goblins

@onready var player_1: Player1 = $Player1
@onready var game_over_menu: GameOverPanel = %GameOverMenu
@onready var gema: Area2D = $Gema


#hola
func _ready() -> void:
	game_over_menu.retry_button.pressed.connect(reiniciar_nivel)
	player_1.personaje_murio.connect(game_over_menu.show)
func reiniciar_nivel():
	get_tree().reload_current_scene()


#func tomar_objeto():
	#if Input.is_action_just_pressed("agarrar_gema"):
		#player_1.curar()
		#gema.queue_free()

extends Node

@onready var player_1: Player1 = %Player1
@onready var game_over_menu: GameOverPanel = %GameOverMenu


var jugador_stats : EntityStats = EntityStats.new()


var ultimo_checkpoint: Checkpoint
signal actualizar_mision(objetivo)
signal agarrar_monedas(cantidad)

# Direcciones / Paths de ESCENAS
const GAME = "uid://b1vi0w77pfodo"
const MENU_GAME = "uid://dcn1mwxx7g0po"
const OPTIONS = "uid://dcuf3t1o82k15"

const PANTALLA_CARGA = ("uid://cw0a7c4di4kbt")
const CINEMÁTICA = preload("uid://ehfskq01jd8l")
const NIVEL_2 = preload("uid://dp32bdanmb7ks")
const NIVEL_3 = preload("uid://bef77pt26v5b7")

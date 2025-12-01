extends Node


var jugador: Player1

var ultimo_checkpoint: Checkpoint
signal actualizar_mision(objetivo)
signal agarrar_monedas(cantidad)

# Direcciones / Paths de ESCENAS
const GAME = "uid://b1vi0w77pfodo"
const MENU_GAME = "uid://dcn1mwxx7g0po"
const OPTIONS = "uid://dcuf3t1o82k15"

const PANTALLA_CARGA = ("uid://cw0a7c4di4kbt")
const TRANSICIÓN_NIVEL = preload("uid://ehfskq01jd8l")

# Niveles
const NIVEL_1 = preload("uid://ceapxigsjwfqo")
const NIVEL_2 = preload("uid://dp32bdanmb7ks")
const NIVEL_3 = preload("uid://bef77pt26v5b7")

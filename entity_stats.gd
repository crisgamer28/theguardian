class_name EntityStats
extends Resource


@export_category("Entidad")
# Stats de pelea
@export var vida_maxima := 5
@export var velocidad_movimiento := 100
@export var velocidad_ataque := 100
@export var fuerza := 1



var vidas_actuales = vida_maxima
 
func curar():
	vidas_actuales = vida_maxima

func morir():
	pass

func recibir_daño(cantidad: int):
	pass

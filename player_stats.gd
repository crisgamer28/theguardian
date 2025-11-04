class_name PlayerStats
extends EntityStats

@export_category("Registro Progreso")
@export var gemas_recolectadas := 0
@export var enemigos_derrotados := 0
@export var veces_muerto := 0

 
func curar():
	vidas_actuales = vida_maxima

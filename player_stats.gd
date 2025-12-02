class_name PlayerStats
extends EntityStats

@export_category("Registro Progreso")
@export var gemas_recolectadas := 0
@export var enemigos_derrotados := 0
@export var veces_muerto := 0
@export var habilidades := 0


#func recibir_daño(cantidad: int):
	#vidas_actuales -= cantidad
	#if vidas_actuales < 0:
		#vidas_actuales = 0
 #
#func curar():
	#vidas_actuales = vida_maxima
	#if vidas_actuales > vida_maxima:
		#vidas_actuales = vida_maxima
		

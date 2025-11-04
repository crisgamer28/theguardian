class_name Mision
extends Node

enum Tipo {
	GEMAS = 0,
	ENEMIGOS = 1,
}


@export var tipo_de_mision: Tipo
@export var cantidad_objetivo: int = 0

@export_multiline var descripcion_inicial: String
@export_multiline var descripcion_ganaste: String
@export_multiline var descripcion_perdiste: String

@export var contenedor_enemigos: ContenedorEnemigos
#@export var contenedor_gemas: ContenedorGemas TODO

#@export var recompensa TODO

var esta_activa: bool = false

signal mision_iniciada
signal cambio_objetivo(cantidad: int)
signal mision_ganada
signal mision_fallida

func empezar_mision():
	esta_activa = true
	if tipo_de_mision == Tipo.ENEMIGOS:
		cantidad_objetivo = contenedor_enemigos.get_cantidad_de_enemigos()
		print(descripcion_inicial % cantidad_objetivo)
		mision_iniciada.emit(descripcion_inicial)
		contenedor_enemigos.enemigo_acaba_de_morir.connect(_chequear_progreso)
	pass

func ganar_mision():
	esta_activa = false
	mision_ganada.emit()
	#dar_recompensa()

func fallar_mision():
	esta_activa = false
	pass

func _chequear_progreso():
	if tipo_de_mision == Tipo.ENEMIGOS:
		var nueva_cantidad_enemigos = contenedor_enemigos.get_cantidad_de_enemigos()
		if nueva_cantidad_enemigos == cantidad_objetivo:
			return
		else:
			cantidad_objetivo = nueva_cantidad_enemigos
			cambio_objetivo.emit(cantidad_objetivo)
			
			if 1 > cantidad_objetivo:
				ganar_mision()

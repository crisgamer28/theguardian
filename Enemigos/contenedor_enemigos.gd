class_name ContenedorEnemigos
extends Node2D

var lista_de_enemigos: Array[Enemy]

signal enemigo_acaba_de_morir

func _ready() -> void:
	for enemigo in get_children():
		lista_de_enemigos.append(enemigo)
		enemigo.tree_exited.connect(enemigo_murio.bind(enemigo))


func enemigo_murio(enemigo: Enemy):
	lista_de_enemigos.erase(enemigo)
	enemigo_acaba_de_morir.emit()


func get_cantidad_de_enemigos():
	return lista_de_enemigos.size()


func spawnear_enemigo(enemigo: Enemy, donde: Vector2):
	add_child(enemigo)
	lista_de_enemigos.append(enemigo)
	enemigo.tree_exited.connect(enemigo_murio.bind(enemigo))


func limpiar_enemigos():
	for enemigo: Enemy in lista_de_enemigos:
		enemigo.morir()

extends Node
class_name ContenedorMonedas


var _total_monedas : int
var _monedas_agarradas : int 


func _ready() -> void:
	var monedas := get_children()
	_total_monedas = monedas.size()
	
	for moneda in monedas:
		moneda.contenedor_monedas = self
		
func moneda_agarrada():
	_monedas_agarradas += 1
	if _monedas_agarradas == _total_monedas:
		print("Nivel superado")

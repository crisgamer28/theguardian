extends CanvasLayer

@onready var label: Label = $Label

func _ready() -> void:
	Globales.actualizar_mision.connect(actualizar_misión)
	Globales.agarrar_monedas.connect(recoger_monedas)

func actualizar_misión(cantidad : int):
	label.text = "enemigos restantes : %s" %str(cantidad)
	
func recoger_monedas(cantidad_monedas : int):
	label.text = "Recoge tus monedas! : %s" %str(cantidad_monedas)

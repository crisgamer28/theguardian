class_name Interfaz
extends CanvasLayer

@onready var barravida: TextureProgressBar = %Barravida

func actualizar_vida(vidas: int):
	barravida.value = vidas

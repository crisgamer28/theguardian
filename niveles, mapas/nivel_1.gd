extends Nivel

@onready var mision: Mision = $Mision

func _ready() -> void:
	mision.empezar_mision()

extends StateManager

@export var jugador : Player1

func _ready() -> void:
	for state in states:
		state.jugador = jugador
		state.state_manager = self
		state_dic[state.state_name] = state

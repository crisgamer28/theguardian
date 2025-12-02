extends StateManager

@export var enemigo : SkeletonDark


func _ready() -> void:
	for state in states:
		state.enemigo = enemigo 
		state.state_manager = self
		state_dic[state.state_name] = state

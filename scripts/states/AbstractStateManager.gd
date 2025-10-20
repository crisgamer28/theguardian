extends Node
class_name StateManager

@export var states : Array[State] = []
var state_dic = {}

@export var current_state : State

func _ready() -> void:
	for state in states:
		state_dic[state.state_name] = state

func change_state(state_name : String):
	#print(state_name)
	current_state.on_exit()
	current_state = state_dic[state_name]
	current_state.on_enter()

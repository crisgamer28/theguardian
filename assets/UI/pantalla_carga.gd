extends CanvasLayer

var scene_load_status : int
@onready var timer: Timer = $Timer
@onready var anim: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	anim.play("carga")
	timer.start()
	#ResourceLoader.load_threaded_request(Globales.GAME)
#func _process(delta: float) -> void:
	#scene_load_status = ResourceLoader.load_threaded_get_status(Globales.GAME)
	#
	#if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		#get_tree().create_timer(5.0).timeout
		#get_tree().call_deferred("change_scene_to_packed", ResourceLoader.load_threaded_get(Globales.GAME))
	
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(Globales.CINEMÁTICA)

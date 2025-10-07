extends CharacterBody2D

const MAX_SPEED : float = 50.0
const GRAVITY : float = 25.0
var motion = Vector2()
func _ready():
	motion.x = MAX_SPEED


func _next_to_left_wall() -> bool:
	return $Leftray.is_colliding()
func _next_to_right_wall() -> bool:
	return $Rightray.is_colliding()
func _floordetection() -> bool:
	return $AnimatedSprite2D/floordetection.is_colliding()
	
func _flip():
	if _next_to_left_wall() or _next_to_right_wall() or !_floordetection():
		motion.x *= -1
		$AnimatedSprite2D.scale.x *= -1
func _process(_delta):
	motion.y = GRAVITY
	_flip()
	motion = move_and_slide()

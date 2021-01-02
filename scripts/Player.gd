extends KinematicBody2D

const GRAVITY = 50000
const FRICTION = 0.25
export (int) var jump_height = 10000
export (int) var move_speed = 5000
var motion : Vector2


func _input(event):
	if event.is_action_pressed("jump"):
		if is_on_floor():
			motion.y = -jump_height
	
	if event.is_action_pressed("left"):
		motion.x -= move_speed
		
	if event.is_action_pressed("right"):
		motion.x += move_speed


func apply_gravity(delta):
	if !is_on_floor():
		motion.y += delta * GRAVITY
		motion.y = clamp(motion.y, -jump_height, 2 * jump_height)


func pressing_left():
	return Input.is_action_pressed("left")
	
	
func pressing_right():
	return Input.is_action_pressed("right")


func apply_friction(delta):
	if not(pressing_right() or pressing_left()):
		motion.x *= FRICTION


func _process(delta):
	apply_gravity(delta)
	apply_friction(delta)
	move_and_slide(motion * delta, Vector2.UP)

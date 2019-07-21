extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -600

var motion = Vector2() #vector2 can hold x and y
	

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	motion = move_and_slide(motion, UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		print("Collided with: ", collision.collider.name)
		if collision.collider.name == "Button":
			GRAVITY = 2
			$Sprite.modulate = Color(0, 0, 1)
		if collision.collider.name == "Reverse Button":
			GRAVITY = 20
			$Sprite.modulate = Color(1, 1, 1)

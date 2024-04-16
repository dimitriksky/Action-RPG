extends CharacterBody2D

const ACCELERATION = 3
const FRICTION = 3
const MAX_SPEED = 100

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	move_and_slide()
	

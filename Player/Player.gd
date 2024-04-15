extends CharacterBody2D

const MOVE_SPEED: float = 100

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
		
	velocity = input_direction * MOVE_SPEED
	move_and_slide()
	

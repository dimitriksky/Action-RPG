extends CharacterBody2D

const ACCELERATION = 6
const FRICTION = 10
const MAX_SPEED = 100

@onready var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * MAX_SPEED, ACCELERATION)
		animationPlayer.play("run_right")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		animationPlayer.play("idle_right")
	
	move_and_slide()
	

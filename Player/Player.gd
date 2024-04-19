extends CharacterBody2D

const ACCELERATION = 50
const FRICTION = 50
const MAX_SPEED = 80

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * MAX_SPEED, ACCELERATION)
		animation_tree.set("parameters/Run/blend_position", input_direction)
		animation_tree.set("parameters/Idle/blend_position", input_direction)
		state_machine.travel("Run")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		state_machine.travel("Idle")
		
	move_and_slide()
	

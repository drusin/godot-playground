extends KinematicBody2D

enum State { MOVE, ROLL, ATTACK }

var velocity = Vector2();
export var max_speed = 80;
export var acceleration = 500;
export var friction = 500;
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get('parameters/playback');
var state = State.MOVE;


func _ready():
	animation_tree.active = true


func _physics_process(delta):
	match state:
		State.MOVE:
			move_state(delta)
		State.ROLL:
			pass
		State.ATTACK:
			attack_state()


func move_state(delta):
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	input_vector.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		animation_tree.set('parameters/Idle/blend_position', input_vector)
		animation_tree.set('parameters/Run/blend_position', input_vector)
		animation_tree.set('parameters/Attack/blend_position', input_vector)
		animation_state.travel('Run')
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		animation_state.travel('Idle')
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	velocity = move_and_slide(velocity)

	if Input.is_action_just_pressed("attack"):
		state = State.ATTACK


func attack_state():
	velocity = Vector2()
	animation_state.travel('Attack')
	yield(get_tree().create_timer(0.4), 'timeout')
	state = State.MOVE
	

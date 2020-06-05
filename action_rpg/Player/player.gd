extends KinematicBody2D

enum State { MOVE, ROLL, ATTACK }

export var MAX_SPEED = 80
export var ACCELERATION = 500
export var FRICTION = 500
export var ROLL_SPEED = 125

onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get('parameters/playback')
onready var sword_hitbox = $HitboxPivot/SwordHitbox
onready var hurtbox = $Hurtbox

var velocity = Vector2()
var state = State.MOVE
var roll_vector = Vector2.DOWN
var stats = PlayerStats


func _ready():
	stats.connect('no_health', self, 'queue_free')
	animation_tree.active = true
	sword_hitbox.knockback_vector = roll_vector


func _physics_process(delta):
	match state:
		State.MOVE:
			move_state(delta)
		State.ROLL:
			roll_state()
		State.ATTACK:
			attack_state()


func move_state(delta):
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	input_vector.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		sword_hitbox.knockback_vector = input_vector
		animation_tree.set('parameters/Idle/blend_position', input_vector)
		animation_tree.set('parameters/Run/blend_position', input_vector)
		animation_tree.set('parameters/Attack/blend_position', input_vector)
		animation_tree.set('parameters/Roll/blend_position', input_vector)
		animation_state.travel('Run')
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel('Idle')
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move()

	if Input.is_action_just_pressed("roll"):
		state = State.ROLL

	if Input.is_action_just_pressed("attack"):
		state = State.ATTACK


func roll_state():
	velocity = roll_vector * ROLL_SPEED
	animation_state.travel("Roll")
	move()


func attack_state():
	animation_state.travel('Attack')
	yield(get_tree().create_timer(0.4), 'timeout')
	state = State.MOVE


func move():
	velocity = move_and_slide(velocity)
	

func roll_animation_finished():
	velocity = velocity * 0.8
	state = State.MOVE


func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	hurtbox.start_invincibility(0.5)
	hurtbox.create_hit_effect()

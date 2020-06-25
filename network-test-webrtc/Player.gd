extends KinematicBody2D

const TICK_RATE = 1 / 1

export var SPEED = 20

var accumulator = 0.0

onready var controller = $Controller
onready var tween = $Tween


func _physics_process(delta):
# warning-ignore:return_value_discarded
	move_and_slide(controller.movement * SPEED)
	
	if is_network_master():
		accumulator += delta
		if (accumulator >= TICK_RATE):
			accumulator -= TICK_RATE
			rpc_unreliable("set_position", position)


puppet func set_position(pos):
	tween.interpolate_property(self, "position", position, pos, 0)

extends Node

var movement = Vector2.ZERO


func _process(delta):
	if is_network_master():
		movement.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
		movement.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
		movement.normalized()
		rpc_unreliable("set_movement", movement)

puppet func set_movement(mov):
	movement = mov

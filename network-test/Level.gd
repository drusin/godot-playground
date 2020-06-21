extends Node2D


func _ready():
	if get_tree().is_network_server():
		# For the server, give control of player 2 to the other peer. 
		$Player2/Controller.set_network_master(get_tree().get_network_connected_peers()[0], false)
	else:
		# For the client, give control of player 2 to itself.
		$Player2/Controller.set_network_master(get_tree().get_network_unique_id(), false)

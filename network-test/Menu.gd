extends Control

const DEFAULT_PORT = 8910
const IP = "127.0.0.1"

var level = "res://Level.tscn"

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _player_connected(_id):
	get_tree().change_scene(level)
	queue_free()


func _on_Server_pressed():
	var host = NetworkedMultiplayerENet.new()
	host.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = host.create_server(DEFAULT_PORT, 1) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		# Is another server running?
		print("Can't host, address in use.")
		print(err)
		return
	
	get_tree().set_network_peer(host)
	$Server.set_disabled(true)
	$Client.set_disabled(true)


func _on_Client_pressed():
	var host = NetworkedMultiplayerENet.new()
	host.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	host.create_client(IP, DEFAULT_PORT)
	get_tree().set_network_peer(host)
	get_tree().change_scene(level)
	queue_free()
	

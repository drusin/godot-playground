extends Control

const DEFAULT_PORT = 8910
const IP = "127.0.0.1"

var online = WebRTCMultiplayer.new()

var level = "res://Level.tscn"

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _player_connected(_id):
	get_tree().change_scene(level)
	queue_free()


func _on_Server_pressed():
	var err = online.create_server(DEFAULT_PORT, 1) # Maximum of 1 peer, since it's a 2-player game.
	if err != OK:
		# Is another server running?
		print("Can't host, address in use.")
		print(err)
		return
	
	get_tree().set_network_peer(online)


func _on_Client_pressed():
	online.create_client(IP, DEFAULT_PORT)
	get_tree().set_network_peer(online)
	get_tree().change_scene(level)
	queue_free()
	

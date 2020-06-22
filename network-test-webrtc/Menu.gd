extends Control

const DEFAULT_PORT = 8910
const IP = "127.0.0.1"
const PEER_CONFIG = { "iceServers": [ { "urls": ["stun:stun.l.google.com:19302"] } ] }

var rtc_multiplayer = WebRTCMultiplayer.new()

var level = "res://Level.tscn"


func _ready():
	# warning-ignore:return_value_discarded
	WebSocketClientWrapper.connect("connected", self, "connected")
	# warning-ignore:return_value_discarded
	WebSocketClientWrapper.connect("peer_connected", self, "peer_connected")
	# warning-ignore:return_value_discarded
	WebSocketClientWrapper.connect("server_id_recieved", self, "server_id_recieved")
	# warning-ignore:return_value_discarded
	WebSocketClientWrapper.connect("offer_recieved", self, "offer_recieved")
	
	
func _process(_delta):
	rtc_multiplayer.poll()


func connected(id):
	rtc_multiplayer.initialize(id, true)
	print('My ID: ' + str(id))


func peer_connected(id):
	if id == rtc_multiplayer.get_unique_id():
		return
	var peer : WebRTCPeerConnection = WebRTCPeerConnection.new()
	# warning-ignore:return_value_discarded
	peer.initialize(PEER_CONFIG)
	# warning-ignore:return_value_discarded
	peer.connect("session_description_created", self, "session_description_created", [id])
	# warning-ignore:return_value_discarded
	peer.connect("ice_candidate_created", self, "ice_candidate_created", [id])
	rtc_multiplayer.add_peer(peer, id)
	print('Peer added: ' + str(id))


func session_description_created(type, sdp, id):
	rtc_multiplayer.get_peer(id).connection.set_local_description(type, sdp)
	match type:
		'offer': WebSocketClientWrapper.send_offer(id, sdp)
		'answer': WebSocketClientWrapper.send_answer(id, sdp)


func server_id_recieved(id):
	if id == rtc_multiplayer.get_unique_id():
		return
	print(rtc_multiplayer.get_peer(id).connection.create_offer())


func offer_recieved(id, offer):
	rtc_multiplayer.get_peer(id).connection.set_remote_description("offer", offer)
	print(offer)
	

func ice_candidate_created(mid_name, index_name, sdp_name, id):
	print(mid_name)


func _on_Timer_timeout():
	print(rtc_multiplayer.get_peers())

extends Control

const DEFAULT_PORT = 8910
const IP = "127.0.0.1"
const PEER_CONFIG = { "iceServers": [ { "urls": ["stun:stun.l.google.com:19302"] } ] }

var rtc_multiplayer = WebRTCMultiplayer.new()

var level = "res://Level.tscn"


func _ready():
	GlobalWebSocketClient.connect("connected", self, "connected")
	GlobalWebSocketClient.connect("peer_connected", self, "peer_connected")
	print(rtc_multiplayer.get_unique_id())


func connected(id):
	rtc_multiplayer.initialize(id, true)


func peer_connected(id):
	var peer : WebRTCPeerConnection = WebRTCPeerConnection.new()
	peer.initialize(PEER_CONFIG)
	rtc_multiplayer.add_peer(peer, id)


func _on_Timer_timeout():
	print(rtc_multiplayer.get_peers())

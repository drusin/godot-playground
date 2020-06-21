extends Node

signal connected(id)
signal peer_connected(id)

const MESSAGES = {
	'ID': 'ID:',
	'PEER': 'PEER:',
}

var client = WebSocketClient.new()


func _ready():
	client.connect('connection_established', self, '_connected')
	client.connect('data_received', self, '_parse_message')
	client.connect_to_url('ws://localhost:9081')
	
	
func _process(_delta):
	var status = client.get_connection_status()
	if status == WebSocketClient.CONNECTION_CONNECTING or status == WebSocketClient.CONNECTION_CONNECTED:
		client.poll()


func _connected(_protocol):
	print(client.get_connected_host())
	
	
func _parse_message():
	var message = client.get_peer(1).get_packet().get_string_from_utf8().split('\n')
	match message[0]:
		MESSAGES.ID:
			emit_signal("connected", int(message[1]))
		MESSAGES.PEER:
			emit_signal("peer_connected", int(message[1]))
	

extends Node

var client = WebSocketClient.new()


func _ready():
	client.connect('connection_established', self, '_connected')
	client.connect('data_received', self, '_parse_message')
	client.connect_to_url('ws://localhost:9080')
	
	
func _process(_delta):
	var status = client.get_connection_status()
	if status == WebSocketClient.CONNECTION_CONNECTING or status == WebSocketClient.CONNECTION_CONNECTED:
		client.poll()


func _connected(_protocol):
	print(client.get_connected_host())
	
	
func _parse_message():
	print(client.get_peer(1).get_packet().get_string_from_utf8())

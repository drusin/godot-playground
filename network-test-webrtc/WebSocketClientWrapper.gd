extends Node

signal connected(id)
signal peer_connected(id)
signal server_id_recieved(id)
signal offer_recieved(id, offer)
signal answer_recieved(id, answer)

const MESSAGES = {
	'ID': 'ID:',
	'PEER': 'PEER:',
	'SERVER': 'SERVER:',
	'OFFER': 'OFFER:',
	'ANSWER': 'ANSWER:'
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
	client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
	
	
func _parse_message():
	var message_raw = client.get_peer(1).get_packet().get_string_from_utf8()
	var message = message_raw.split('\n')
	print(message)
	match message[0]:
		MESSAGES.ID:
			emit_signal("connected", int(message[1]))
		MESSAGES.PEER:
			emit_signal("peer_connected", int(message[1]))
		MESSAGES.SERVER:
			emit_signal("server_id_recieved", int(message[1]))
		MESSAGES.OFFER:
			var payload = PoolStringArray(message.slice(2, message.size())).join('\n')
			emit_signal("offer_recieved", int(message[1]), payload)
		MESSAGES.OFFER:
			print("Answe recieved!")
			print(message_raw)
	
	
func send_message(id, header, data):
	client.get_peer(1).put_packet(("%s\n%d\n%s" % [header, id, data]).to_utf8())


func send_offer(id, sdp):
	send_message(id, MESSAGES.OFFER, sdp)


func send_answer(id, sdp):
	send_message(id, MESSAGES.ANSWER, sdp)

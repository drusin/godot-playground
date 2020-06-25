extends Node

signal connected(id)
signal peer_connected(id)
signal server_id_recieved(id)
signal offer_recieved(id, offer)
signal answer_recieved(id, answer)
signal candiate_recieved(id, mid_name, index_name, sdp_name)

const MESSAGES = {
	'ID': 'ID',
	'PEER': 'PEER',
	'SERVER': 'SERVER',
	'OFFER': 'OFFER',
	'ANSWER': 'ANSWER',
	'CANDIDATE': 'CANDIDATE',
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
	var message = Message.new(client.get_peer(1).get_packet().get_string_from_utf8())
	match message.type:
		MESSAGES.ID:
			emit_signal("connected", message.id)
		MESSAGES.PEER:
			emit_signal("peer_connected", message.id)
		MESSAGES.SERVER:
			emit_signal("server_id_recieved", message.id)
		MESSAGES.OFFER:
			emit_signal("offer_recieved", message.id, message.payload)
		MESSAGES.ANSWER:
			emit_signal("answer_recieved", message.id, message.payload)
		MESSAGES.CANDIDATE:
			var split_payload = message.payload.split("\n")
			emit_signal("candiate_recieved", message.id, split_payload[0], int(split_payload[1]), split_payload[2])
		_:
			print("Something else")
			print(message)
	
	
func send_message(id, header, data):
	send_message_raw("%s\n%d\n%s" % [header, id, data])
	
	
func send_message_raw(string):
	client.get_peer(1).put_packet(string.to_utf8())


func send_offer(id, sdp):
	send_message(id, MESSAGES.OFFER, sdp)


func send_answer(id, sdp):
	send_message(id, MESSAGES.ANSWER, sdp)
	
	
func send_candidate(id, mid_name, index_name, sdp_name):
	send_message_raw(stringify([MESSAGES.CANDIDATE, id, mid_name, index_name, sdp_name]))
	
	
static func stringify(args: Array):
	return PoolStringArray(args).join('\n')
	
	
class Message:
	var type = ''
	var id: int = -1
	var payload = null
	
	func _init(message):
		var split = message.split('\n')
		type = split[0]
		id = int(split[1])
		split.remove(0)
		split.remove(0)
		payload = split.join('\n')

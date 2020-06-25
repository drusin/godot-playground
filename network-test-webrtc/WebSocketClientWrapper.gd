extends Node

signal connected(id)
signal peer_connected(id)
signal server_id_recieved(id)
signal offer_recieved(id, offer)
signal answer_recieved(id, answer)
signal candiate_recieved(id, mid_name, index_name, sdp_name)

const MESSAGES = {
	"ID": "ID",
	"PEER": "PEER",
	"SERVER": "SERVER",
	"OFFER": "OFFER",
	"ANSWER": "ANSWER",
	"CANDIDATE": "CANDIDATE",
}

var client = WebSocketClient.new()


func _ready():
	client.connect("connection_established", self, "_on_connection_established")
	client.connect("data_received", self, "_on_data_received")


func _process(_delta):
	var status = client.get_connection_status()
	if status == WebSocketClient.CONNECTION_CONNECTING or status == WebSocketClient.CONNECTION_CONNECTED:
		client.poll()


func connect_to(url):
	client.connect_to_url(url)


func send_offer(id, sdp):
	_send_message(MESSAGES.OFFER, id, [sdp])


func send_answer(id, sdp):
	_send_message(MESSAGES.ANSWER, id, [sdp])


func send_candidate(id, mid_name, index_name, sdp_name):
	_send_message(MESSAGES.CANDIDATE, id, [mid_name, index_name, sdp_name])


func _send_message(header, id, payload: Array = []):
	client.get_peer(1).put_packet(_create_msg(header, id, payload).to_utf8())


static func _create_msg(type, id, payload: Array = []):
	return JSON.print({
		"type": type,
		"id": id,
		"payload": payload
	})


func _on_connection_established(_protocol):
	print(client.get_connected_host())
	client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)


func _on_data_received():
	_parse_message(JSON.parse(
			client.get_peer(1).get_packet().get_string_from_utf8()
			).result)


func _parse_message(message):
	match message.type:
		MESSAGES.ID:
			emit_signal("connected", message.id)
		MESSAGES.PEER:
			emit_signal("peer_connected", message.id)
		MESSAGES.SERVER:
			emit_signal("server_id_recieved", message.id)
		MESSAGES.OFFER:
			emit_signal("offer_recieved", message.id, message.payload[0])
		MESSAGES.ANSWER:
			emit_signal("answer_recieved", message.id, message.payload[0])
		MESSAGES.CANDIDATE:
			emit_signal("candiate_recieved", message.id, message.payload[0], message.payload[1], message.payload[2])

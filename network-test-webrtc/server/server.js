const WebSocket = require('ws');
const crypto = require('crypto');

const PING_INTERVAL = 10000;
const PORT = process.env.PORT || 9081;

const SERVER_ID = 1;

const server = new WebSocket.Server({ port: PORT });

const MESSAGES = {
	ID: 'ID',
	PEER: 'PEER',
	START_SERVER: 'START_SERVER',
	JOIN_SERVER: 'JOIN_SERVER',
	SERVER_ID: 'SERVER_ID',
	OFFER: 'OFFER',
	ANSWER: 'ANSWER',
	CANDIDATE: 'CANDIDATE',
};

/**
 * Message Structure:
 * {
 * 	type: 'SERVER',
 * 	id: 123976,
 * 	payload: [data0, data1, data2]
 * }
 */
function createMsg(type, id, payload) {
	return JSON.stringify({ type, id, payload });
}

function randomId () {
	return Math.abs(new Int32Array(crypto.randomBytes(4).buffer)[0]);
}

class Peer {
	constructor(webSocket, id) {
		this.webSocket = webSocket;
		this._id = id;
		this.isServer = false;
	}
	
	get id() {
		return this.isServer ? SERVER_ID : this._id;
	}
}

const peers = new Map();

function broadcastPeers() {
	for (peer of peers.values()) {
		for (id of peers.keys()) {
			if (peer.id !== id) {
				peer.webSocket.send(createMsg(MESSAGES.PEER, id));
				peer.webSocket.send(createMsg(MESSAGES.SERVER_ID, SERVER_ID))
			}
		}
	}
}

server.on('connection', (webSocket) => {
	const peer = new Peer(webSocket, randomId());
	peers.set(peer.id, peer);

	console.log(`A new client connected!: ${peer.id}`);

	webSocket.on('message', data => {
		const message = JSON.parse(data)
		switch (message.type) {
			case MESSAGES.START_SERVER:
				peers.delete(peer.id);
				peer.isServer = true;
				peers.set(peer.id, peer);
				webSocket.send(createMsg(MESSAGES.ID, peer.id));
				break;
			case MESSAGES.JOIN_SERVER:
				webSocket.send(createMsg(MESSAGES.ID, peer.id));
				broadcastPeers();
				break;
			case MESSAGES.OFFER:
				//fall through
			case MESSAGES.ANSWER:
				//fall through
			case MESSAGES.CANDIDATE:
				peers.get(message.id).webSocket.send(createMsg(message.type, peer.id, message.payload));
				break;
		}
	});

	webSocket.on('close', () => {
		console.log(`Client disconnected!: ${peer.id}`);
		peers.delete(peer.id);
	})
});

setInterval(() => {
	server.clients.forEach(ws => ws.ping());
	console.log(server.clients.size);
}, PING_INTERVAL);
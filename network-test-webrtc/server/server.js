const WebSocket = require("ws");
const crypto = require("crypto");

const PING_INTERVAL = 10000;
const PORT = 9081;

const SERVER_ID = 1;

const server = new WebSocket.Server({ port: PORT });

const MESSAGES = {
	ID: 'ID',
	PEER: 'PEER',
	SERVER: 'SERVER',
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

const peers = new Map();
const peersReversed = new Map();

server.on('connection', (webSocket) => {
	const id = peers.size > 0 ? randomId() : SERVER_ID;
	peers.set(webSocket, id);
	peersReversed.set(id, webSocket);

	console.log(`A new client connected!: ${id}`);

	webSocket.on('message', data => {
		const message = JSON.parse(data)
		console.log(message);
		switch (message.type) {
			case MESSAGES.OFFER:
				//fall through
			case MESSAGES.ANSWER:
				//fall through
			case MESSAGES.CANDIDATE:
				peersReversed.get(message.id).send(createMsg(message.type, id, message.payload));
				break;
		}
	});

	webSocket.send(createMsg(MESSAGES.ID, id));

	for (client of server.clients) {
		for (peer of peers.keys()) {
			client.send(createMsg(MESSAGES.PEER, peers.get(peer)));
		}
	}

	for (client of server.clients) {
		client.send(createMsg(MESSAGES.SERVER, SERVER_ID));
	}

	webSocket.on('close', () => {
		console.log(`Client disconnected!: ${id}`);
		peers.delete(webSocket);
		peersReversed.delete(id);
	})
});

setInterval(() => {
	server.clients.forEach(ws => ws.ping());
	console.log(server.clients.size);
}, PING_INTERVAL);
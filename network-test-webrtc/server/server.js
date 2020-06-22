const WebSocket = require("ws");
const crypto = require("crypto");

const PING_INTERVAL = 10000;
const PORT = 9081;

const server = new WebSocket.Server({ port: PORT });

const MESSAGES = {
	ID: 'ID:',
	PEER: 'PEER:',
	SERVER: 'SERVER:',
	OFFER: 'OFFER:',
	ANSWER: 'ANSWER:',
};

class Message {
	constructor(str) {
		const split = str.split('\n');
		this.type = split.splice(0, 1)[0];
		this.id = split.splice(0, 1)[0];
		this.payload = split.join('\n');
	}

	set id(id) {
		this._id = Number.parseInt(id);
	}

	get id() {
		return this._id;
	}

	toString() {
		return `${this.type}\n${this.id}\n${this.payload}`;
	}
}

function randomId () {
	return Math.abs(new Int32Array(crypto.randomBytes(4).buffer)[0]);
}

const peers = new Map();
const peersReversed = new Map();
var serverId = null;

server.on('connection', (webSocket) => {
	const id = randomId();
	peers.set(webSocket, id);
	peersReversed.set(id, webSocket);

	if (!serverId) {
		serverId = id;
	}

	console.log(`A new client connected!: ${id}`);

	webSocket.on('message', data => {
		console.log(data);
		const message = new Message(data);
		console.log(message);
		switch (message.type) {
			case MESSAGES.OFFER:
				//fall through
			case MESSAGES.ANSWER:
				const recieverId = message.id;
				message.id = id;
				console.log(recieverId);
				console.log(message.id);
				peersReversed.get(recieverId).send(message.toString());
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
		client.send(createMsg(MESSAGES.SERVER, serverId));
	}

	webSocket.on('close', () => {
		console.log(`Client disconnected!: ${id}`);
		peers.delete(webSocket);
		peersReversed.delete(id);
		if (serverId === id) {
			serverId = null;
		}
	})
});

function createMsg(header, ...payload) {
	var returnVal = header;
	payload.forEach(s => returnVal += `\n${s}`);
	return returnVal;
}

setInterval(() => {
	server.clients.forEach(ws => ws.ping());
	console.log(server.clients.size);
}, PING_INTERVAL);
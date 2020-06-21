const WebSocket = require("ws");
const crypto = require("crypto");

const PING_INTERVAL = 10000;
const PORT = 9081;

const server = new WebSocket.Server({ port: PORT });

const MESSAGES = {
	ID: 'ID:',
	PEER: 'PEER:'
};

function randomId () {
	return Math.abs(new Int32Array(crypto.randomBytes(4).buffer)[0]);
}

const peers = new Map()

server.on('connection', (webSocket, request) => {
	const id = server.clients.size > 1 ? randomId() : 1;
	peers.set(webSocket, id);

	console.log(`A new client connected!: ${id}`);

	webSocket.on('message', data => {
		console.log(data);
	});

	webSocket.send(`${MESSAGES.ID}\n${id}`);

	if (server.clients.size > 1) {
		for (client of server.clients) {
			for (peer of peers.keys()) {
				if (peer != client) {
					client.send(`${MESSAGES.PEER}\n${peers.get(peer)}`);
				}
			}
		}
	}

	if (server.clients.size >= 2) {
		Array.from(server.clients)[0].send('SERVER');
		Array.from(server.clients)[1].send('CLIENT');
	}

	webSocket.on('close', () => {
		console.log(`Client disconnected!: ${id}`);
		peers.delete(webSocket)
	})
});

setInterval(() => {
	server.clients.forEach(ws => ws.ping());
	console.log(server.clients.size);
}, PING_INTERVAL);
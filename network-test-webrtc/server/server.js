const WebSocket = require("ws");

const PING_INTERVAL = 10000;
const PORT = 9080;

const server = new WebSocket.Server({ port: PORT });

server.on('connection', (webSocket, request) => {
	console.log(`A new client connected!: ${request.socket.remoteAddress}`);
	if (server.clients.size >= 2) {
		Array.from(server.clients)[0].send('SERVER');
		Array.from(server.clients)[1].send('CLIENT');
	}
});

setInterval(() => {
	server.clients.forEach(ws => ws.ping());
	console.log(server.clients.size);
}, PING_INTERVAL);
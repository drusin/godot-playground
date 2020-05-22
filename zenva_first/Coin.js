import { doExports } from 'res://jsHelper.js';

export default class Coin extends godot.Area2D {
	static export(vars) {
		vars({ value: 1 });
	}

	_ready() {
		this.rotationSpeed = 90;
	}

	_process(delta) {
		this.rotation_degrees += this.rotationSpeed * delta;
	}
	
	_onCoinBodyEntered(body) {
		if (body.name === 'Player') {
			body.collectCoin(this.value);
			this.queue_free();
		}
	}
}

doExports(Coin);

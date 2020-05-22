import { doExports } from 'res://jsHelper.js';

export default class Enemy extends godot.Area2D {
	static export(vars) {
		vars({
			speed: 100,
			moveDist: 100
		});
	}

	_ready() {
		this.startX = this.position.x;
		this.targetX = this.position.x + this.moveDist;
	}
	
	_process(delta) {
		this.position = new godot.Vector2(this.moveTo(this.position.x, this.targetX, this.speed * delta), this.position.y);

		if (this.position.x === this.targetX) {
			this.targetX = this.targetX === this.startX ? this.startX + this.moveDist : this.startX;
		}
	}

	moveTo(current, to, step) {
		let newPos = current;

		if (newPos < to) {
			newPos += step;
			if (newPos > to) {
				newPos = to;
			}
		}
		else {
			newPos -= step;
			if (newPos < to) {
				newPos = to;
			}
		}

		return newPos;
	}
	
	_onEnemyBodyEntered(body) {
		if (body.name === 'Player') {
			body.die();
		}
	}
}

doExports(Enemy);

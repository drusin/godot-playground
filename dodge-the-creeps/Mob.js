import { registerChildren, doExports } from 'res://jsHelper.js';
const MOB_TYPES = ['walk', 'swim', 'fly'];

export default class Mob extends godot.RigidBody2D {
	static export(vars) {
		vars({
			minSpeed: 150,
			maxSpeed: 250
		});
	}
	
	_ready() {
		registerChildren(this);
		this.$.AnimatedSprite.animation = MOB_TYPES[godot.abs(godot.randi() % MOB_TYPES.length)];
		this.$.AnimatedSprite.play();
	}

	_onVisibilityScreenExited() {
		this.queue_free();
	}
	
	_onStartGame() {
		this.queue_free();
	}
}

doExports(Mob);

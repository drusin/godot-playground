const MOB_TYPES = ['walk', 'swim', 'fly'];

export default class Mob extends godot.RigidBody2D {
	static register() {
		godot.register_property(Mob, 'minSpeed', 150);
		godot.register_property(Mob, 'maxSpeed', 250);
	}

	_ready() {
		this.get_node('AnimatedSprite').animation = MOB_TYPES[godot.abs(godot.randi() % MOB_TYPES.length)];
	}

	_onVisibilityScreenExited() {
		this.queue_free();
	}
}

Mob.register();

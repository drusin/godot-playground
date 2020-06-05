export default class Grass extends godot.Node2D {
	
	_ready() {
		this.GrassEffect = godot.load('res://Effects/GrassEffect.tscn');
		this.world = this.get_tree().current_scene;
	}

	createGrassEffect() {
		const grassEffect = this.GrassEffect.instance();
		this.world.add_child(grassEffect);
		grassEffect.global_position = this.global_position;
	}
	
	_onHurtboxAreaEntered() {
		this.createGrassEffect();
		this.queue_free();
	}
}

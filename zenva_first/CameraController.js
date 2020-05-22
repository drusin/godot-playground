export default class CameraController extends godot.Camera2D {
	_ready() {
		this.player = this.get_node('/root/MainScene/Player');
	}

	_process(delta) {
		this.position = new godot.Vector2(this.player.position.x, this.position.y);
	}
}

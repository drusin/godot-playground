export default class CameraFollow extends godot.Camera2D {
    _ready() {
        this.target = this.get_node('/root/MainScene/Player');
    }

    _process() {
        this.position = this.target.position;
    }
}
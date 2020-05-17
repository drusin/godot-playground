export default class HUD extends godot.CanvasLayer {
	static export() {
		godot.register_signal(HUD, 'startGame');
	}

	showMessage(text) {
		const messageLabel = this.get_node('MessageLabel');
		messageLabel.text = text;
		messageLabel.show();
		this.get_node('MessageTimer').start();
	}

	showGameOver() {
		this.showMessage('Game Over');
		godot.yield(this.get_node('MessageTimer'), 'timeout');

		const messageLabel = this.get_node('MessageLabel');
		messageLabel.text = 'Dodge the Creeps!';
		messageLabel.show();

		godot.yield(this.get_tree().create_timer(1), 'timeout');

		this.get_node('StartButton').show();
	}
	
	updateScore(score) {
		this.get_node('ScoreLabel').text = score.toString();
	}

	_onMessageTimerTimeout() {
		this.get_node('MessageLabel').hide();
	}

	_onStartButtonPressed() {
		this.get_node('StartButton').hide();
		this.emit_signal('startGame');
	}
}

HUD.export();

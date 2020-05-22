import { registerChildren, doExports } from 'res://jsHelper.js';

export default class HUD extends godot.CanvasLayer {
	static export(vars, signal) {
		signal('startGame');
	}

	_ready() {
		registerChildren(this);
	}

	showMessage(text) {
		this.$.MessageLabel.text = text;
		this.$.MessageLabel.show();
		this.$.MessageTimer.start();
	}

	async showGameOver() {
		this.showMessage('Game Over');
		await godot.yield(this.$.MessageTimer, 'timeout');

		this.$.MessageLabel.text = 'Dodge the Creeps!';
		this.$.MessageLabel.show();

		await godot.yield(this.get_tree().create_timer(1), 'timeout');

		this.$.StartButton.show();
	}
	
	updateScore(score) {
		this.$.ScoreLabel.text = score.toString();
	}

	_onMessageTimerTimeout() {
		this.$.MessageLabel.hide();
	}

	_onStartButtonPressed() {
		this.$.StartButton.hide();
		this.emit_signal('startGame');
	}
}

doExports(HUD);

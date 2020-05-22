import { registerChildren } from 'res://jsHelper.js';

export default class UI extends godot.Control {
	_ready() {
		registerChildren(this);
		this.$.ScoreText.text = '0';
	}

	setScoreText(score) {
		this.$.ScoreText.text = score.toString();
	}
}

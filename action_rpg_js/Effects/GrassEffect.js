import { registerChildren } from 'res://jsHelper.js';

export default class GrassEffect extends godot.Node2D {

	_ready() {
		registerChildren(this);
		this.$.AnimatedSprite.frame = 0;
		this.$.AnimatedSprite.play('Animate');
	}

	_onAnimatedSpriteAnimationFinished() {
		this.queue_free();
	}
}


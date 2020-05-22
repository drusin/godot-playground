import { registerChildren, doExports } from 'res://jsHelper.js';

export default class Player extends godot.Area2D {
	static export(vars, signal) {
		vars({ speed: 400 });
		signal('hit');
	}
	
	_ready() {
		registerChildren(this);
		this.screenSize = this.get_viewport_rect().size;
		this.hide();
	}
	
	_process(delta) {
		let velocity = new godot.Vector2();
		if (godot.Input.is_action_pressed('ui_right')) {
			velocity.x += 1;
		}
		if (godot.Input.is_action_pressed('ui_left')) {
			velocity.x -= 1;
		}
		if (godot.Input.is_action_pressed('ui_up')) {
			velocity.y -= 1;
		}
		if (godot.Input.is_action_pressed('ui_down')) {
			velocity.y += 1;
		}
		const sprite = this.$.AnimatedSprite;
		if (velocity.length() > 0) {
			velocity = velocity.normalized() * this.speed;
			sprite.play();
		}
		else {
			sprite.stop();
		}
		this.position += velocity * delta;
		this.position = new godot.Vector2(
			godot.clamp(this.position.x, 0, this.screenSize.x),
			godot.clamp(this.position.y, 0, this.screenSize.y),
		);
		
		if (velocity.x != 0) {
			sprite.animation = 'right';
			sprite.flip_v = false;
			sprite.flip_h = velocity.x < 0;
		}
		else if (velocity.y != 0) {
			sprite.animation = 'up';
			sprite.flip_v = velocity.y > 0;
		}
	}
	
	_onPlayerBodyEntered(body) {
		this.hide();
		this.emit_signal('hit');
		this.$.CollisionShape2D.set_deferred('disabled', true);		
	}
	
	start(position) {
		this.position = position;
		this.show();
		this.$.CollisionShape2D.disabled = false;
	}
}

doExports(Player);

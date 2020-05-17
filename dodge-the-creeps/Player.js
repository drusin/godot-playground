export default class Player extends godot.Area2D {
	static export() {
		godot.register_property(Player, 'speed', 400);
	}
	
	_ready() {
		this.screenSize = this.get_viewport_rect().size;
		// this.hide();
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
		const sprite = this.get_node('AnimatedSprite');
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
	
}

Player.export();

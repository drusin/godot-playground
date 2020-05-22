import { registerChildren } from 'res://jsHelper.js';

export default class Player extends godot.KinematicBody2D {
	static export() {

	}

	_ready() {
		registerChildren(this);
		this.score = 0;
		this.speed = 200;
		this.jumpForce = 600;
		this.gravitiy = 800;
		this.vel = new godot.Vector2();
		this.sprite = this.$.Sprite;
		this.ui = this.get_node('/root/MainScene/CanvasLayer/UI');
	}
	
	_physics_process(delta) {
		this.vel.x = 0;
		if (godot.Input.is_action_pressed('move_left')) {
			this.vel.x -= this.speed;
		}
		if (godot.Input.is_action_pressed('move_right')) {
			this.vel.x += this.speed;
		}

		this.vel = this.move_and_slide(this.vel, godot.Vector2.UP);
		this.vel.y += this.gravitiy * delta;

		if (godot.Input.is_action_just_pressed('jump') && this.is_on_floor()) {
			this.vel.y -= this.jumpForce;
		}

		if (this.vel.x < 0) {
			this.sprite.flip_h = true;
		}
		else if (this.vel.x > 0) {
			this.sprite.flip_h = false;
		}
	}
	
	die() {
		this.get_tree().reload_current_scene();
	}
	
	collectCoin(value) {
		this.score += value;
		this.ui.setScoreText(this.score);
	}
}

Player.export();

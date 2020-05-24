import { registerChildren } from 'res://jsHelper.js';

const STATE = {
	MOVE: 'move',
	ROLL: 'roll',
	ATTACK: 'attack'
}

export default class Player extends godot.KinematicBody2D {

	_ready() {
		registerChildren(this);
		this.velocity = new godot.Vector2();
		this.maxSpeed = 80;
		this.accelaration = 500;
		this.friction = 500;
		this.animationState = this.$.AnimationTree.get('parameters/playback');
		this.$.AnimationTree.active = true;
		this.state = STATE.MOVE;
	}

	_physics_process(delta) {
		switch (this.state) {
			case STATE.MOVE:
				this.moveState(delta);
				break;
			case STATE.ROLL:
				break;
			case STATE.ATTACK:
				this.attackState(delta)
		}
	}

	moveState(delta) {
		let inputVector = new godot.Vector2();
		inputVector.x = godot.Input.get_action_strength('ui_right') - godot.Input.get_action_strength('ui_left');
		inputVector.y = godot.Input.get_action_strength('ui_down') - godot.Input.get_action_strength('ui_up');
		inputVector = inputVector.normalized();

		if (inputVector != godot.Vector2.ZERO) {
			this.$.AnimationTree.set('parameters/Idle/blend_position', inputVector);
			this.$.AnimationTree.set('parameters/Run/blend_position', inputVector);
			this.$.AnimationTree.set('parameters/Attack/blend_position', inputVector);
			this.animationState.travel('Run');
			this.velocity = this.velocity.move_toward(inputVector * this.maxSpeed, this.accelaration * delta);
		}
		else {
			this.animationState.travel('Idle');
			this.velocity = this.velocity.move_toward(godot.Vector2.ZERO, this.friction * delta);
		}

		this.velocity = this.move_and_slide(this.velocity);
		
		if (godot.Input.is_action_just_pressed('attack')) {
			this.state = STATE.ATTACK;
		}
	}

	async attackState(delta) {
		this.velocity = new godot.Vector2();
		this.animationState.travel('Attack');
		await godot.yield(this.get_tree().create_timer(0.4), 'timeout');
		this.state = STATE.MOVE
	}
}

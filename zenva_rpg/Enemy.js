import { registerChildren, doExports } from 'res://jsHelper.js';

export default class Enemy extends godot.KinematicBody2D {
	static export(vars) {
		vars({
			xpToGive: 30
		});
	}

	_ready() {
		registerChildren(this);
		this.currentHp = 5;
		this.maxHp = 5;
		this.moveSpeed = 150;
		this.damage = 1;
		this.attackRate = 1;
		this.attackDist = 80;
		this.chaseDist = 400;
		this.target = this.get_node('/root/MainScene/Player');
		
		this.$.Timer.wait_rime = this.attackRate;
		this.$.Timer.start();
	}

	_physics_process() {
		const dist = this.position.distance_to(this.target.position);
		if (dist > this.attackDist && dist < this.chaseDist) {
			const vel = (this.target.position - this.position).normalized();
			this.move_and_slide(vel * this.moveSpeed);
		}
	}
	
	_onTimerTimeout() {
		if (this.position.distance_to(this.target.position) <= this.attackDist) {
			this.target.takeDamage(this.damage);
		}
	}

	takeDamage(dmgToTake) {
		this.currentHp -= dmgToTake;
		if (this.currentHp <= 0) {
			this.die();
		}
	}

	die() {
		this.target.giveXp(this.xpToGive);
		this.queue_free();
	}
}

doExports(Enemy);

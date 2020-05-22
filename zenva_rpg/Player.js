import { registerChildren } from 'res://jsHelper.js';

export default class extends godot.KinematicBody2D {
	_ready() {
		registerChildren(this);
		this.currentHp = 10;
		this.maxHp = 10;
		this.moveSpeed = 250;
		this.damage = 1;

		this.gold = 0;

		this.currentLevel = 0;
		this.currentXp = 0;
		this.xpToNextLevel = 50;
		this.xpToLevelIncreaseRate = 1.2;

		this.interactDistance = 70;

		this.vel = new godot.Vector2();
		this.facingDir = new godot.Vector2();
		
		this.ui = this.get_node('/root/MainScene/CanvasLayer/UI');

		this.ui.updateLevelText(this.currentLevel);
		this.ui.updateHealthBar(this.currentHp, this.maxHp);
		this.ui.updateXpBar(this.currentXp, this.xpToNextLevel);
		this.ui.updateGoldText(this.gold);
	}
	
	_physics_process(delta) {
		this.vel = new godot.Vector2();

		if (godot.Input.is_action_pressed('move_up')) {
			this.vel.y -= 1;
			this.facingDir = new godot.Vector2(0, -1);
		}
		if (godot.Input.is_action_pressed('move_down')) {
			this.vel.y += 1;
			this.facingDir = new godot.Vector2(0, 1);
		}
		if (godot.Input.is_action_pressed('move_left')) {
			this.vel.x -= 1;
			this.facingDir = new godot.Vector2(-1, 0);
		}
		if (godot.Input.is_action_pressed('move_right')) {
			this.vel.x += 1;
			this.facingDir = new godot.Vector2(1, 0);
		}
		
		this.vel = this.vel.normalized();

		this.move_and_slide(this.vel * this.moveSpeed);
		
		this.manageAnimations();
	}
	
	manageAnimations() {
		if (this.vel.x > 0) {
			this.playAnimation('MoveRight');
		}
		else if (this.vel.x < 0) {
			this.playAnimation('MoveLeft');
		}
		else if (this.vel.y > 0) {
			this.playAnimation('MoveDown');
		}
		else if (this.vel.y < 0) {
			this.playAnimation('MoveUp');
		}
		else if (this.facingDir.x === 1) {
			this.playAnimation('IdleRight');
		}
		else if (this.facingDir.x === -1) {
			this.playAnimation('IdleLeft');
		}
		else if (this.facingDir.y === 1) {
			this.playAnimation('IdleDown');
		}
		else if (this.facingDir.y === -1) {
			this.playAnimation('IdleUp');
		}
	}
	
	_process(delta) {
		if (godot.Input.is_action_just_pressed('interact')) {
			this.tryInteract();
		}
	}

	tryInteract() {
		console.log('trying to interact!');
		this.$.RayCast2D.cast_to = this.facingDir * this.interactDistance;

		if (this.$.RayCast2D.is_colliding()) {
			console.log('I have a collision!');

			if (this.$.RayCast2D.get_collider() instanceof godot.KinematicBody2D) {
				this.$.RayCast2D.get_collider().takeDamage(this.damage);
			}
			else if (this.$.RayCast2D.get_collider().onInteract) {
				this.$.RayCast2D.get_collider().onInteract(this);
			}
		}
	}

	playAnimation(animName) {
		if (this.$.AnimatedSprite.animation != animName) {
			this.$.AnimatedSprite.play(animName);
		}
	}

	giveXp(amount) {
		this.currentXp += amount;
		
		this.ui.updateXpBar(this.currentXp, this.xpToNextLevel);

		if (this.currentXp >= this.xpToNextLevel) {
			this.levelUp();
		}
	}

	levelUp() {
		const overflowXp = this.currentXp - this.xpToNextLevel;
		this.xpToNextLevel *= this.xpToLevelIncreaseRate;
		this.currentXp = overflowXp;
		this.currentLevel++;
		
		this.ui.updateXpBar(this.currentXp, this.xpToNextLevel);
		this.ui.updateLevelText(this.currentLevel);
	}
	
	giveGold(amount) {
		this.gold += amount;
		this.ui.updateGoldText(this.gold);
	}
	
	takeDamage(dmgToTake) {
		this.currentHp -= dmgToTake;
		
		this.ui.updateHealthBar(this.currentHp, this.maxHp);

		if (this.currentHp <= 0) {
			this.die();
		}
	}

	die() {
		this.get_tree().reload_current_scene();
	}
}

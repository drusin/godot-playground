import { registerChildren, doExports } from 'res://jsHelper.js';

export default class Main extends godot.Node {
	static export(vars) {
		vars({ Mob: new godot.PackedScene() });
	}
	
	_ready() {
		registerChildren(this);
		godot.randomize();
	}
	
	gameOver() {
		this.$.ScoreTimer.stop();
		this.$.MobTimer.stop();
		
		this.$.HUD.showGameOver();
	}

	newGame() {
		this.score = 0;
		this.$.Player.start(this.$.StartPosition.position);
		this.$.StartTimer.start();
		
		this.$.HUD.updateScore(this.score);
		this.$.HUD.showMessage('Get Ready');
	}

	_onMobTimerTimeout() {
		const spawnLocation = this.get_node('MobPath/MobSpawnLocation');
		spawnLocation.offset = godot.randi();
		const mob = this.Mob.instance();
		this.add_child(mob);
		let direction = spawnLocation.rotation + godot.PI / 2;
		mob.position = spawnLocation.position;
		direction += godot.rand_range(-godot.PI / 4, godot.PI / 4);
		mob.rotation = direction;
		mob.linear_velocity = new godot.Vector2(godot.rand_range(mob.minSpeed, mob.maxSpeed), 0);
		mob.linear_velocity = mob.linear_velocity.rotated(direction);
		
		this.$.HUD.connect('startGame', mob, "_onStartGame");
	}

	_onScoreTimerTimeout() {
		this.score += 1;
		this.$.HUD.updateScore(this.score);
	}

	_onStartTimerTimeout() {
		this.$.MobTimer.start();
		this.$.ScoreTimer.start();
	}
}

doExports(Main);

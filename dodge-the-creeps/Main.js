export default class Main extends godot.Node {
	static register() {
		// This crashed the editor
		// godot.register_property(Main, 'Mob', godot.PackedScene);
	}
	
	constructor() {
		super();
		// workaround for the problem mentioned above
		this.Mob = godot.load('res://Mob.tscn');
	}
	
	_ready() {
		godot.randomize();
		this._onMobTimerTimeout();
	}
	
	gameOver() {
		this.get_node('ScoreTimer').stop();
		this.get_node('MobTimer').stop();
	}

	newGame() {
		this.score = 0;
		this.get_node('Player').start(this.get_node('StartPosition'.position));
		this.get_node('StartTimer').start();
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
	}

	_onScoreTimerTimeout() {
		this.score += 1;
	}

	_onStartTimerTimeout() {
		this.get_node('MobTimer').start();
		this.get_node('ScoreTimer').start();
	}
}

Main.register();

export default class Main extends godot.Node {
	static register() {
		// This crashes the editor
		// godot.register_property(Main, 'Mob', godot.PackedScene);
	}
	
	constructor() {
		super();
		// workaround for the problem mentioned above
		this.Mob = godot.load('res://Mob.tscn');
	}
	
	_ready() {
		godot.randomize();
	}
	
	gameOver() {
		this.get_node('ScoreTimer').stop();
		this.get_node('MobTimer').stop();
		
		this.get_node('HUD').showGameOver();
	}

	newGame() {
		this.score = 0;
		this.get_node('Player').start(this.get_node('StartPosition').position);
		this.get_node('StartTimer').start();
		
		const hud = this.get_node('HUD');
		hud.updateScore(this.score);
		hud.showMessage('Get Ready');
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
		
		this.get_node('HUD').connect('startGame', mob, "_onStartGame");
	}

	_onScoreTimerTimeout() {
		this.score += 1;
		this.get_node('HUD').updateScore(this.score);
	}

	_onStartTimerTimeout() {
		this.get_node('MobTimer').start();
		this.get_node('ScoreTimer').start();
	}
}

Main.register();

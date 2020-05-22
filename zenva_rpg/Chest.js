import { doExports } from 'res://jsHelper.js';

export default class Chest extends godot.StaticBody2D {
	static export(vars) {
		vars({
			goldToGive: 5
		});
	}

	onInteract(player) {
		console.log('interacted!');
		player.giveGold(this.goldToGive);
		this.queue_free();
	}
}

doExports(Chest);

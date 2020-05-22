export default class UI extends godot.Control {
	
	_ready() {
		this.levelText = this.get_node('BG/LevelBG/LevelText');
		this.healthBar = this.get_node('BG/HealthBar');
		this.xpBar = this.get_node('BG/XpBar');
		this.goldText = this.get_node('BG/GoldText');
	}

	updateLevelText(level) {
		this.levelText.text = level.toString();
	}

	updateHealthBar(curHp, maxHp) {
		this.healthBar.value = (100 / maxHp) * curHp;
	}

	updateXpBar(curXp, xpToNextLevel) {
		this.xpBar.value = (100 / xpToNextLevel) * curXp;
	}

	updateGoldText(gold) {
		this.goldText.text = `Gold: ${gold}`;
	}
}

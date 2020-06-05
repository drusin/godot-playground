extends Area2D

const HitEffect = preload("res://Effects/Hiteffect.tscn")

var invincible = false setget set_invincible
onready var timer = $Timer

signal invicibility_started
signal invicibility_endet


func set_invincible(value):
	invincible = value
	if value:
		emit_signal('invicibility_started')
	else:
		emit_signal('invicibility_endet')


func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)


func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invicibility_started():
	set_deferred("monitorable", false)


func _on_Hurtbox_invicibility_endet():
	set_deferred("monitorable", true)

extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invincible
onready var timer = $Timer
onready var collision_shape = $CollisionShape2D

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
	collision_shape.set_deferred("disabled", true)


func _on_Hurtbox_invicibility_endet():
	collision_shape.disabled = false

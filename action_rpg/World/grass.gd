extends Node2D

onready var GrassEffect = load("res://Effects/GrassEffect.tscn")
onready var world = get_tree().current_scene


func create_grass_effect():
	var grass_effect = GrassEffect.instance()
	world.add_child(grass_effect)
	grass_effect.global_position = global_position


func _on_Hurtbox_area_entered(_area):
	create_grass_effect()
	queue_free()

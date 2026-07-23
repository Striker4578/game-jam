extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $"%/Timer"


func _on_body_entered(body: Node2D) -> void:
	if Global.level == 0:
		print("win")
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/level_spike_hide.tscn")
		Global.level += 1
	elif Global.level == 1:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/level_up_down.tscn")
		Global.level += 1
	elif Global.level == 2:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/level_base.tscn")

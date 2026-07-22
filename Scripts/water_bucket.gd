extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $"../Countdown/Timer"


func _on_body_entered(body: Node2D) -> void:
	print("win")
	get_tree().change_scene_to_file("res://Scenes/level_spike_hide.tscn")

	

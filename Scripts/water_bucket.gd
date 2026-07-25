extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $"%Timer"

const LEVELS = [
	"res://Scenes/level_first_box.tscn",
	"res://Scenes/level_spike_hide.tscn",
	"res://Scenes/level_up_down.tscn",
	"res://Scenes/level_jumpo.tscn",
	"res://Scenes/level_springbpo.tscn",
	"res://Scenes/level_walljump.tscn"
	
]


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		collision_shape_2d.set_deferred("disabled", true)
		
		if Global.level < LEVELS.size():
			var next_level_path = LEVELS[Global.level]
			Global.level += 1
			get_tree().call_deferred("change_scene_to_file", next_level_path)

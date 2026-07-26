extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $"%Timer"

const LEVELS = [
	"res://Scenes/level_boxstart.tscn",
	"res://Scenes/level_first_box.tscn",
	"res://Scenes/level_holes.tscn",
	"res://Scenes/level_spike_hide.tscn",
	"res://Scenes/level_up_down.tscn",
	"res://Scenes/level_jumpo.tscn",
	"res://Scenes/level_springbpo.tscn",
	"res://Scenes/level_torch.tscn",
	"res://Scenes/level_gunfight.tscn",
	"res://Scenes/level_springtorch.tscn",
	"res://Scenes/level_many_springs.tscn",
	"res://Scenes/level_whatcomesaround.tscn",
	"res://Scenes/level_left_to_right.tscn",
	"res://Scenes/level_ringaround.tscn",
	"res://Scenes/level_hugobig.tscn",
	"res://Scenes/level_best.tscn"
	
	
	
]


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		collision_shape_2d.set_deferred("disabled", true)
		
		if "has_won" in body:
			body.has_won = true
			body.velocity = Vector2.ZERO
		body.animated_sprite_2d.play("happy")
		
		await body.animated_sprite_2d.animation_finished
		if Global.level < LEVELS.size():
			var next_level_path = LEVELS[Global.level]
			Global.level += 1
			get_tree().call_deferred("change_scene_to_file", next_level_path)

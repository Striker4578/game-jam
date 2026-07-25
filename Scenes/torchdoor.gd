extends StaticBody2D

@onready var sfx_door: AudioStreamPlayer2D = $sfx_door
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var physical_collision: CollisionShape2D = $PhysicalCollision


var lit_torches_count: int = 0
const TORCHES_NEEDED: int = 3


func _ready() -> void:
	for child in get_children():
		if child.has_signal("torch_lit"):
			child.torch_lit.connect(_on_torch_lit)
			
func _on_torch_lit() -> void:
	lit_torches_count += 1
	print(lit_torches_count)
	if lit_torches_count >= TORCHES_NEEDED:
		open_door()
		
func open_door() -> void:
	sfx_door.play()
	$AnimatedSprite2D.hide()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$PhysicalCollision.set_deferred("disabled", true)
	await sfx_door.finished
	queue_free()

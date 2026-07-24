extends StaticBody2D

@onready var sfx_door: AudioStreamPlayer2D = $sfx_door
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var physical_collision: CollisionShape2D = $PhysicalCollision


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_key:
		body.has_key = false
		open_door()
		
func open_door() -> void:
	sfx_door.play()
	$AnimatedSprite2D.hide()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$PhysicalCollision.set_deferred("disabled", true)
	await sfx_door.finished
	queue_free()

extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var point_light_2d: PointLight2D = $PointLight2D

@onready var sfx_key: AudioStreamPlayer2D = $sfx_key


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.has_key = true
		sfx_key.play()
		
	$AnimatedSprite2D.hide()
	$PointLight2D.hide()
	$CollisionShape2D.set_deferred("disabled", true)
	
	await sfx_key.finished
	queue_free()

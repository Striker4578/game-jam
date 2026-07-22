extends StaticBody2D

@export var bullet_scene: PackedScene
@onready var shoot_timer: Timer = $ShootTimer

var target: Node2D = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		if shoot_timer.is_stopped():
			shoot_timer.start()
	else:
		shoot_timer.stop()
		


func _on_detection_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = body
		
func _on_detection_range_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		
func _on_shoot_timer_timeout() -> void:
	if target:
		shoot()
		
func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.rotation = global_rotation

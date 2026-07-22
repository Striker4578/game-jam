extends Area2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += -direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): 
		call_deferred("queue_free")
		get_tree().call_deferred("reload_current_scene")
	elif not body.is_in_group("turret"):
		call_deferred("queue_free")

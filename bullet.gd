extends Area2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += -direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): 
		if body.has_method("die") and not body.is_dead:
			body.die()
			Global.player.get_node("sfx_blow").play()
			queue_free()
		
	queue_free()

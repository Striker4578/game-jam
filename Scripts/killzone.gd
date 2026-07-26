extends Area2D


func _on_body_entered(body: Node2D) -> void:
	BackgroundMusic.play(15.0)
	get_tree().call_deferred("reload_current_scene")

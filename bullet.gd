extends Area2D

@export var speed: float = 200.0

func _ready() -> void:
	body_entered.connect(on_bullet_hit)

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += -direction * speed * delta

func on_bullet_hit(body: Node2D) -> void:
	if body.is_in_group("player"): 
		queue_free() 
	elif not body.is_in_group("turret"):
		queue_free()

	


func _on_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()

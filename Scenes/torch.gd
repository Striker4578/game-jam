extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump

signal torch_lit

var is_lit: bool = false

func _ready() -> void:
	$AnimatedSprite2D.hide()
	$Sprite2D.show()
	$PointLight2D.hide()
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not is_lit:
		is_lit = true
		$AnimatedSprite2D.show()
		sfx_jump.play()
		$AnimatedSprite2D.play("fire")
		$PointLight2D.show()

		
		torch_lit.emit()

extends StaticBody2D

@onready var sfx_door: AudioStreamPlayer2D = $sfx_door
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var Daphysical: CollisionShape2D = $Daphysical

var unique_lit_torches: Array = []
const TORCHES_NEEDED: int = 3

func _ready() -> void:
	await get_tree().process_frame
	var level_torches = get_tree().get_nodes_in_group("torches")
	for torch in level_torches:
		if torch.has_signal("torch_lit"):
			torch.torch_lit.connect(_on_torch_lit.bind(torch))

func _on_torch_lit(incoming_torch: Node2D) -> void:
	if not unique_lit_torches.has(incoming_torch.name):
		unique_lit_torches.append(incoming_torch.name)
		print("Unique Torches Lit: ", unique_lit_torches.size(), " / ", TORCHES_NEEDED)
		
		if unique_lit_torches.size() >= TORCHES_NEEDED:
			open_door()

func open_door() -> void:
	sfx_door.play()
	$AnimatedSprite2D.hide()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$Daphysical.set_deferred("deferred", true)
	await sfx_door.finished
	queue_free()

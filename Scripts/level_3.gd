extends TileMap

@onready var spawn_point: Marker2D = $SpawnPoint
var player_scene = preload("res://Scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = player_scene.instantiate()
	player.global_position = spawn_point.global_position
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node

# Starts level at 0 checks number when winning level to know which level to go to
var level: int = 0

var player: CharacterBody2D = null

func goto_next_level(next_level_path: String) -> void:
	get_tree().change_scene_to_file(next_level_path)
	BackgroundMusic.play(15) 

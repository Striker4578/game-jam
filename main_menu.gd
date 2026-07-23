extends Node2D


var button_type = null
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	button_type = "credits"
	

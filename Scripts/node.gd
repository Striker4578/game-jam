extends Node

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

func _ready():
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	var time_array = time_left_to_live()
	label.text = "%02d:%02d" % time_array
	
	var current_second = time_array[1]
	
	if current_second % 2 != 0:
		label.modulate = Color.RED
	else:
		label.modulate = Color.WHITE
	

	
	
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

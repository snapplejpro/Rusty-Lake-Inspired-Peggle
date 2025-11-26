extends Button

func _ready():
	BackgroundMusic.stream_paused = true
	$"../AudioStreamPlayer".play()
	
func _on_pressed() -> void:
	Transition.change_scene("res://Scenes/test_board.tscn")
	$"../AudioStreamPlayer".stop()
	BackgroundMusic.stream_paused = false
	get_parent().queue_free()

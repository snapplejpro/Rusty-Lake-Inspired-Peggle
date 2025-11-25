extends Button

var list_of_scenes = ["res://Scenes/test_board.tscn", "res://Scenes/test_board2.tscn","res://Scenes/test_board3.tscn",
"res://Scenes/test_board4.tscn"]

func _ready():
	$"../AudioStreamPlayer2D".play()
	BackgroundMusic.stream_paused = true
	await $"../AudioStreamPlayer2D".finished
	BackgroundMusic.stream_paused = false
func _on_pressed() -> void:
	Transition.change_scene(list_of_scenes[Transition.level])
	get_parent().queue_free()

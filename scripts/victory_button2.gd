extends Button

func _ready():
	$"../AudioStreamPlayer2D".play()
	BackgroundMusic.stream_paused = true
	await $"../AudioStreamPlayer2D".finished
	BackgroundMusic.stream_paused = false
func _on_pressed() -> void:
	Transition.change_scene("res://Scenes/finale.tscn")
	get_parent().queue_free()

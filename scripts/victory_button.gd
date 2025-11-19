extends Button

var list_of_scenes = ["res://Scenes/test_board.tscn", "res://Scenes/test_board2.tscn"]

func _ready():
	pass
func _on_pressed() -> void:
	Transition.change_scene(list_of_scenes[Transition.level])
	get_parent().queue_free()

extends CanvasLayer

var victory_scene = preload("res://Scenes/level_complete.tscn")
func change_scene(target: String) -> void:
	visible = true
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	visible = false
	
func _ready():
	visible = false

func victory():
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	victory_scene.instantiate()
	add_child(victory_scene)
	

extends CanvasLayer

var level: int
var score: int

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
	level = 0
	score = 150
	
func play():
	visible = true
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	visible = false

func victory():
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	var instance = victory_scene.instantiate()
	get_tree().get_root().add_child(instance)
	
	
	

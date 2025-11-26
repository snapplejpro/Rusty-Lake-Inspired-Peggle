extends CanvasLayer

var level: int
var score: int
const HOLD_TIME := 2.0  # seconds required to quit
var hold_timer := 0.0

var victory_scene = preload("res://Scenes/level_complete.tscn")
var victory_scene2 = preload("res://Scenes/level_complete2.tscn")
func change_scene(target: String) -> void:
	visible = true
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	visible = false

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		hold_timer += delta
		if hold_timer >= HOLD_TIME:
			get_tree().quit()
	else:
		# Reset if button is released
		hold_timer = 0.0

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
	
	
func victory2():
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	var instance = victory_scene2.instantiate()
	get_tree().get_root().add_child(instance)
	
	

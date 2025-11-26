extends Node2D
const ball_scene = preload("res://Scenes/Ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BackgroundMusic.stream_paused = true
	$ColorRect.visible = false
	$AudioStreamPlayer.play()

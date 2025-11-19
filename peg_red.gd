extends Area2D

var ball
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball = get_tree().get_root().get_node("TestBoard/Ball")

func _on_body_exited(_body: Node2D) -> void:
	var tweem = create_tween()
	tweem.tween_property(get_parent(),"modulate", Color(modulate.r, modulate.g, modulate.b, 0.0), 0.3)
	await tweem.finished
	ball.hit()
	get_parent().queue_free()

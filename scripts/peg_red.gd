extends Area2D

var ball

func _on_body_exited(_body: Node2D) -> void:
	$"../AudioStreamPlayer2D".pitch_scale = randf_range(1.0, 1.1)
	$"../AudioStreamPlayer2D".play()
	ball = get_tree().get_root().get_node("TestBoard/Ball")
	var tweem = create_tween()
	tweem.tween_property(get_parent(),"modulate", Color(modulate.r, modulate.g, modulate.b, 0.0), 0.3)
	await tweem.finished
	ball.hit()
	get_parent().queue_free()

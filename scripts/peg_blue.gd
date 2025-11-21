extends Area2D

var ball
var red_ref = preload("res://Scenes/PegRed.tscn")

func _on_body_exited(_body: Node2D) -> void:
	ball = get_tree().get_root().get_node("TestBoard/Ball")
	var tweem = create_tween()
	tweem.tween_property(get_parent(),"modulate", Color(modulate.r, modulate.g, modulate.b, 0.0), 0.3)
	await tweem.finished
	ball.hit()
	var one = red_ref.instantiate()
	get_tree().get_root().get_node("TestBoard/Pegs").add_child(one)

	var two = red_ref.instantiate()
	get_tree().get_root().get_node("TestBoard/Pegs").add_child(two)
	one.global_position = self.global_position
	two.global_position = self.global_position
	one.global_position += Vector2(randi_range(1,100), randi_range(1,100))
	two.global_position -= Vector2(-randi_range(1,100), -randi_range(1,100))

	get_parent().queue_free()

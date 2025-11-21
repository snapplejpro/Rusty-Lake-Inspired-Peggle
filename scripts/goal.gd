extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	$buffalo.play()
	get_parent().ball_count += 1
	get_parent().ballspawned = false
	body.queue_free()
	get_node("ye").text = "Free Ball!"
	await get_tree().create_timer(1.5).timeout
	get_node("ye").text = ""

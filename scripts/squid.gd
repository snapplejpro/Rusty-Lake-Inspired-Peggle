extends AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees -= 90

func shoot():
	self.animation = "Shoot"
	await get_tree().create_timer(0.5).timeout
	self.animation = "Idle"

extends Label

@onready var ball = get_tree().get_root().get_node("TestBoard/Ball")
@onready var label = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().ball_count = 5
	update()

func update():
	label.text = "Score: " + str(get_parent().count) + \
	"\nBalls Remaining: " + str(get_parent().ball_count)

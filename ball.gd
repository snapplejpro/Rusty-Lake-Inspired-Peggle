extends RigidBody2D

@onready var label = get_parent().get_child(2)
@onready var body := self

static var count: int

func _ready() -> void:
	PhysicsServer2D.body_set_mode(body.get_rid(), PhysicsServer2D.BODY_MODE_RIGID)

func hit():
	count += 10
	label.update()

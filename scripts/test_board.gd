extends Node2D

var ballspawned = false
var impulse_strength
var ball_count
const ball_scene = preload("res://Scenes/Ball.tscn")
@onready var squid = get_node("Squid")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_count = 5
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("click") and !ballspawned and ball_count > 0:
		squid.shoot()
		#spawns ball
		var newi = ball_scene.instantiate()
		add_child(newi)
		var mouse = get_local_mouse_position()
		newi.global_position = Vector2(576, 28)
		newi.z_index = -1
		newi.look_at(mouse)
		newi.rotation_degrees -= 90
		
		#sets conditions
		ballspawned = true
		ball_count -= 1
		#Shoots ball
		var distance = newi.global_position.distance_to(mouse)
		impulse_strength = distance * 2.2
		var direction = (mouse - newi.global_position).normalized()
		@warning_ignore("standalone_expression")
		direction.x + 10
		newi.apply_central_impulse(direction * impulse_strength)

func next():
	Transition.change_scene("res://test_board2.tscn")

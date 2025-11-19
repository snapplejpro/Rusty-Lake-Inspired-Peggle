extends Line2D

@export var gravity: Vector2 = Vector2(0, 800)  # downward gravity
@export var simulation_time := 1.0              # seconds
@export var resolution := 32                # how many points
@export var launch_speed := 900                 # strength of launch

func _process(_delta):
	_draw_trajectory()

func _draw_trajectory():
	clear_points()

	var mouse = get_global_mouse_position()
	var dir = (mouse - global_position).normalized()
	var velocity = dir * launch_speed

	for i in range(resolution):
		var t = (i / float(resolution)) * simulation_time
		var point_global = global_position + velocity * t + 0.5 * gravity * t * t * t

		add_point(to_local(point_global))

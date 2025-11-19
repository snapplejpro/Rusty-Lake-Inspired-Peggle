extends Node2D

var ballspawned = false
var impulse_strength
var ball_count
const ball_scene = preload("res://Scenes/Ball.tscn")
static var count: int
@onready var squid = get_node("Squid")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_count = 5
	$ColorRect.visible = false
	$Squid.animation = "Idle"
	
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
		$Label.update()
		#Shoots ball
		var distance = newi.global_position.distance_to(mouse)
		impulse_strength = distance * 2.2
		var direction = (mouse - newi.global_position).normalized()
		@warning_ignore("standalone_expression")
		direction.x + 10
		newi.apply_central_impulse(direction * impulse_strength)
	if ball_count <= 0:
		$Squid.animation = "corrupt"
		await $Squid.animation_finished
		await get_tree().create_timer(1.5).timeout
		$ColorRect.visible = true
		await get_tree().create_timer(2.5).timeout
		reset()
	if count >= 150:
		$Label.visible = false
		ball_count = 0
		count = 0
		Transition.level += 1
		Transition.victory()
	if event.is_action_released("restart"):
		reset()
func reset():
	get_tree().call_deferred("reload_current_scene")
	count = 0
	$Label.update()

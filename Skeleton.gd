extends KinematicBody

const SENS = 0.005

onready var neck = $NeckPivot
onready var camera = $NeckPivot/Camera
onready var exclude = [self]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion: 
			neck.rotate_y(-event.relative.x * SENS)
			camera.rotate_x(-event.relative.y * SENS)
			camera.rotation.x = clamp(camera.rotation.x, deg2rad(-30), deg2rad(60))

func _input(event): 
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("mouse_shoot"):
		_shoot()
	

func _shoot():
	var space : PhysicsDirectSpaceState = get_world().direct_space_state

	var screen_center = get_viewport().size / 2
	print(screen_center)
	var screen_origin = camera.project_ray_origin(screen_center)
	var camera_ray_normal = camera.project_ray_normal(screen_center)
	print(camera_ray_normal)
	print(camera_ray_normal.length())
	var end = screen_origin + camera.project_ray_normal(screen_center) * 500
	var collision = space.intersect_ray(screen_origin, end, exclude)
	
#	var from = $Camera.global_position
#	var to= $Camera.global_position - $Camera.global_transform.basis.z * 500
#	# print($Camera.global_transform.basis.z)
#	var collision = space.intersect_ray(from, to)
	
	if collision: 
		print("Collision!")
		print(collision.collider_id)
		print(collision.collider)
		var obj = instance_from_id(collision.collider_id)
		print(obj.name)

extends Position3D

var dist_radius = 20
var y_height = 20
var camera_target

func _ready():
	set_as_toplevel(true)

func _input(event): 
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("ui_page_up"):
		shoot()
#		var camera = $Camera
#		var ray_length = 1000
#		var from = camera.project_ray_origin(event.position)
#		var to = from + camera.project_ray_normal(event.position) * ray_length	
		
#func _unhandled_input(event):
#
#	print(Input.get_mouse_mode())
#
#	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#		if event is InputEventMouseMotion: 
#			self.rotate_y(-event.relative.x * SENS)
#			self.rotate_x(-event.relative.y * SENS)
#			$Camera.rotation.x = clamp($Camera.rotation.x, deg2rad(-30), deg2rad(60))
		
func _physics_process(delta):
	var old_cam_pos = global_transform.origin
	
	var rot_axis = Vector3(0,1,0)
	var rot_angle = deg2rad(40*delta)

	var new_cam_pos = old_cam_pos.rotated(rot_axis, rot_angle)
	global_transform.origin = lerp(old_cam_pos, new_cam_pos, 0.25)
	
	$Camera.look_at(Vector3(0,0,0), Vector3(0,1,0))

#	var scene_root = get_parent()
#	var scene_origin = scene_root.global_transform.origin
#	$Camera.look_at(getglobal_transform.origin, Vector3(0,1,0))

func shoot():
	var space : PhysicsDirectSpaceState = get_world().direct_space_state

	var screen_center = get_viewport().size / 2
	print(screen_center)
	var screen_origin = $Camera.project_ray_origin(screen_center)
	var camera_ray_normal = $Camera.project_ray_normal(screen_center)
	print(camera_ray_normal)
	print(camera_ray_normal.length())
	var end = screen_origin + $Camera.project_ray_normal(screen_center) * 500
	var collision = space.intersect_ray(screen_origin, end)
	
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

extends Position3D

var dist_radius = 20
var y_height = 20
var camera_target

func _ready():
	set_as_toplevel(true)

func _input(event): 
	if event.is_action_pressed("ui_page_up"):
		shoot()

func _physics_process(delta):
	var old_cam_pos = global_transform.origin
	
	var rot_axis = Vector3(0,1,0)
	var rot_angle = deg2rad(40*delta)

	var new_cam_pos = old_cam_pos.rotated(rot_axis, rot_angle)
	global_transform.origin = lerp(old_cam_pos, new_cam_pos, 0.25)
	
	$Camera.look_at(Vector3(0,0,0), Vector3(0,1,0))

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
		
	if collision: 
		print("Collision!")
		print(collision.collider_id)
		print(collision.collider)
		var obj = instance_from_id(collision.collider_id)
		print(obj.name)

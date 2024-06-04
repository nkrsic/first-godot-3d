extends Position3D

var dist_radius = 20
var y_height = 20
var camera_target

func _ready():
	set_as_toplevel(true)
	
func _process(delta):
	pass
	
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


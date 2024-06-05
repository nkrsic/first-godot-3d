extends KinematicBody

const SENS = 0.005

onready var neck = $NeckPivot
onready var camera = $NeckPivot/Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion: 
			neck.rotate_y(-event.relative.x * SENS)
			camera.rotate_x(-event.relative.y * SENS)
			camera.rotation.x = clamp(camera.rotation.x, deg2rad(-30), deg2rad(60))

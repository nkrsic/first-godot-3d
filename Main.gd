extends Node

onready var stationary_cam = $StationaryCamera
onready var ball_cam = $Ball/CameraRig/Camera
onready var rotating_cam = $OuterCamera/Camera
onready var skeleton_cam = $Skeleton/NeckPivot/Camera

onready var cams = [
	$StationaryCamera,
	$Ball/CameraRig/Camera,
	$OuterCamera/Camera,
	$Skeleton/NeckPivot/Camera
]

onready var current_cam_idx = 0
onready var current_cam = cams[current_cam_idx]

func _ready():
	current_cam.make_current()

func toggleCameras():
	current_cam_idx = (current_cam_idx + 1) % cams.size()
	cams[current_cam_idx].make_current()
	
func _input(event):
	print(event.as_text())
	if event.is_action_pressed("ui_focus_next"):
		toggleCameras()
	
func _on_Button_pressed():
	toggleCameras()

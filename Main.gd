extends Node

onready var stationary_cam = $StationaryCamera

func _input(event):
	print(event.as_text())
	if event.is_action_pressed("ui_focus_next"):
		stationary_cam.current = not stationary_cam.current
	


func _on_Button_pressed():
	stationary_cam.current = not stationary_cam.current # Replace with function body.

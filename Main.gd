extends Node

onready var cam1 = $Camera

func _input(event):
	print(event.as_text())
	if event.is_action_pressed("ui_focus_next"):
		cam1.current = not cam1.current

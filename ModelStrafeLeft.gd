extends Spatial

onready var anim_player = $"Walk Strafe Left/RootNode/AnimationPlayer"	
onready var anim_tree = $"Walk Strafe Left/RootNode/AnimationTree"
onready var state_machine = anim_tree.get("parameters/playback")

var strafing_left = false

func _ready():
	anim_player.get_animation("idle-loop").loop = true
	state_machine.start("idle-loop")
		
func _input(event):
	print(event)
	# .is_action_pressed only handled once until relased?
	if event.is_action_pressed("ui_right"):
		print("entering ui_right !!! ")
		print("ModelStrafeLeft received a ui_right input!")
		print(state_machine.get_current_node())
#		anim_player.get_animation("idle-loop").loop = false
		anim_player.get_animation("strafe_left-loop").loop = true
		if state_machine.get_current_node() == "strafe_left-loop":
			state_machine.start("strafe_left-loop")
		else: 
			state_machine.travel("strafe_left-loop")
	elif event.is_action_released("ui_right"):
		state_machine.travel("idle-loop")
	else

func _physics_process(_delta):
#	if anim_player.get_queue().size() == 0:
#		anim_player.queue("mixamo.com")
#	var strafing_left = Input.is_action_pressed("ui_right")
	pass

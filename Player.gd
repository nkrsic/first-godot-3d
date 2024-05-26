extends KinematicBody

export var speed = 14
export var fall_acceleration = 75
export var nik_index = 0.5

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)

	# Ground Velocity	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# Vertical velocity 
#	if not is_on_floor(): 
#		velocity.y = velocity.y - (fall_acceleration * delta)

	velocity = move_and_slide(velocity, Vector3.UP)
	

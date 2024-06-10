extends Area

# SOURCE:
# 
# https://kidscancode.org/godot_recipes/3.x/3d/3d_shooting/index.html
#
# Based on tank projectile, slower, figure out what 

signal exploded 

export var muzzle_velocity = 100
export var g = Vector3.DOWN * 20

export var velocity = Vector3.ZERO

func _physics_process(delta):
	#velocity += g * delta
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta
	
func _on_Shell_body_entered(body):
	emit_signal("exploded", transform.origin)
	queue_free()

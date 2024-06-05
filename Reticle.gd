extends CenterContainer

export var DOT_RADIUS = 1
export var DOT_COLOR = Color.white

func _ready():
	pass
	
func _draw():
	draw_circle(Vector2(0,0), DOT_RADIUS, DOT_COLOR)

extends CenterContainer

export var DOT_RADIUS = 1
# light purple color from Rainglow's "Newton Contrast"
export var DOT_COLOR = Color("#b7baff") 

func _ready():
	$Top.default_color = Color("#b7baff") 
	$Right.default_color = Color("#b7baff") 
	$Bottom.default_color = Color("#b7baff") 
	$Left.default_color = Color("#b7baff") 
	
func _draw():
	draw_circle(Vector2(0,0), DOT_RADIUS, DOT_COLOR)

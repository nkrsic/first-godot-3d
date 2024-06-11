extends CenterContainer

export var DOT_RADIUS = 2
# light purple color from Rainglow's "Newton Contrast"
export var DOT_COLOR = Color("#b7baff")


var top0 = Vector2(0,-5) + Vector2(20,20)
var top1 = Vector2(0,-15) + Vector2(20,20)
var right0 = Vector2(5,0) + Vector2(20,20)
var right1 = Vector2(15,0) + Vector2(20,20)
var bottom0 = Vector2(0,5) + Vector2(20,20)
var bottom1 = Vector2(0,15) + Vector2(20,20)
var left0 = Vector2(-5,0) + Vector2(20,20)
var left1 = Vector2(-15,0) + Vector2(20,20)



func _ready():
	$Top.default_color = Color("#b7baff") 
	$Right.default_color = Color("#b7baff") 
	$Bottom.default_color = Color("#b7baff") 
	$Left.default_color = Color("#b7baff") 
	
func _draw():
	draw_circle(Vector2(20,20), DOT_RADIUS, DOT_COLOR)
	draw_line(top0, top1, DOT_COLOR, 2.0)
	draw_line(right0, right1, DOT_COLOR, 2.0)
	draw_line(bottom0, bottom1, DOT_COLOR, 2.0)
	draw_line(left0, left1, DOT_COLOR, 2.0)

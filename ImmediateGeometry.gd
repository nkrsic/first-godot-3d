extends ImmediateGeometry

const CONST_ORANGE = Color(168, 131, 50, 1)

func _ready():
	material_override = SpatialMaterial.new()
	#material_override.emission_enabled
#	material_override.emission = CONST_ORANGE
#	material_override.emission_energy = 3
	
	material_override.albedo_color = Color("#ebae34")
	material_override.vertex_color_use_as_albedo = true
	
#	material_override.transmission_enabled
#	material_override.transmission = CONST_ORANGE
#	material_override.flags_unshaded = true
	material_override.params_line_width = 3.0

func _process(delta):
	clear()
	begin(Mesh.PRIMITIVE_LINES)
	#set_color(Color(168, 131, 50))  # Set the line color
	set_normal(Vector3(0, 0, 1))  # Set the line normal
	add_vertex(Vector3(0, 0, 0))  # Start point of the line
	var to = get_node("../OuterCamera/Camera").global_transform.origin
	add_vertex(to)  # End point of the line
	end()
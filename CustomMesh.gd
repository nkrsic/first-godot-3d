extends CSGMesh


func _ready():
	var z_disp = Vector3(0, -0.259, 0.966)
	var orig = Vector3()
	var y_disp = Vector3(0,1,0)
	var arr = []
	arr.push_back(orig)
	arr.push_back(y_disp)
	arr.push_back(z_disp)
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)

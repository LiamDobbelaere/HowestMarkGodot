extends Spatial

export(PackedScene) var stamp;
var count = 0;
var conditionCount = 0
var distance = 50.0;
var camera;
var frustrum_height;
var frustrum_width;

func _ready():
	camera = get_parent().get_node("Camera");
	# Called every time the node is added to the scene.
	# Initialization here
	
	var aspect = get_viewport().size.x / get_viewport().size.y;
	frustrum_height = 2.0 * -distance * tan(deg2rad(camera.fov * 0.5));
	frustrum_width = frustrum_height * aspect;
	
	pass

func _process(delta):
	var fps = 1 / delta;
	
	print("bench %s, %s\r" % [count,  fps])
	
	for i in range(0, 25):
		var s = stamp.instance();
		
		add_child(s);
		
		var rand_width = rand_range(-frustrum_width/2, frustrum_width/2);
		var rand_height = rand_range(-frustrum_height/2, frustrum_height/2) 
		
		s.set_translation(Vector3(rand_width, rand_height, -distance))
		
		#s.translate(Vector3(screen_pos.x, screen_pos.y, 0) - Vector3(get_viewport().size.x / 2, get_viewport().size.y / 2, 0));	
		#s.translate(Vector3(rand_range(-extents, extents), rand_range(-extents, extents), rand_range(-extents, extents)));
		count += 1;

	if (fps < 60.0): conditionCount+=1
	else: conditionCount = 0
	if conditionCount > 60: get_tree().quit()
	
	pass
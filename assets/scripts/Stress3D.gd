extends Spatial

export(PackedScene) var stamp;
var count = 0;
var conditionCount = 0
var extents = 55.0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var fps = 1 / delta;
	
	print("bench %s, %s\r" % [count,  fps])
		
	for i in range(0, 25):
		var s = stamp.instance();
		add_child(s);
		s.translate(Vector3(rand_range(-extents, extents), rand_range(-extents, extents), rand_range(-extents, extents)));
		count += 1;
	
	if (fps < 60.0): conditionCount+=1
	else: conditionCount = 0
	if conditionCount > 60: get_tree().quit()
	
	pass
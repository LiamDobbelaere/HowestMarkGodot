extends Node2D

export(PackedScene) var stamp;
var count = 0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	print("%s, %s" % [count,  1 / delta])
		
	for i in range(0, 25):
		var s = stamp.instance();
		add_child(s);
		s.set_position(Vector2(randi() % int(get_viewport().size.x), randi() % int(get_viewport().size.y)));
		count += 1;

	pass

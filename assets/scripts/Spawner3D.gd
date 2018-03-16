extends Spatial

export(PackedScene) var ball
var force = 0.5
var count = 0

func _ready():
	pass

func _process(delta):
	print("%s, %s" % [count,  1 / delta])
	
	for i in range(0, 2):
		var b = ball.instance()
		add_child(b)
		b.apply_impulse(Vector3(0, 0, 0), Vector3(force, -force, 0))
		force *= -1
		count += 1
		
	pass
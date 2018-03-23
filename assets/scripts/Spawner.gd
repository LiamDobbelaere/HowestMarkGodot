extends Node2D

export(PackedScene) var ball
var force = 128
var count = 0
var conditionCount = 0

func _ready():
	pass

func _process(delta):
	var fps = 1 / delta;
	
	print("%s, %s" % [count,  fps])

	for i in range(0, 2):	
		var b = ball.instance()
		add_child(b)
		b.apply_impulse(Vector2(0, 0), Vector2(force, 0))
		force *= -1
		count += 1
	
	if (fps < 60.0): conditionCount+=1
	else: conditionCount = 0
	if conditionCount > 60: get_tree().quit()
	
	pass

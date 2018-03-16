extends Node2D

export(PackedScene) var ball
var force = 128
var count = 0

func _ready():
	pass

func _process(delta):
	print("%s, %s" % [count,  1 / delta])

	for i in range(0, 2):	
		var b = ball.instance()
		add_child(b)
		b.apply_impulse(Vector2(0, 0), Vector2(force, 0))
		force *= -1
		count += 1
		
	pass

extends Node2D

export(PackedScene) var ball
var root
var time_passed = 0.0
var force = 128
var count = 0

func _ready():
	root = get_tree().get_root()
	
	pass

func _process(delta):
	print("%s, %s" % [count,  1 / delta])
	
	time_passed += delta
	
	if time_passed > 0.01:
		var b = ball.instance()
		add_child(b)
		b.apply_impulse(Vector2(0, 0), Vector2(force, 0))
		force *= -1
		time_passed = 0.0
		count += 1
		
	pass

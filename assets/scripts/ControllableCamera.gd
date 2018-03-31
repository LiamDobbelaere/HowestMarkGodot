extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	set_position(get_position() + Vector2(int(Input.is_action_pressed("ui_right")) * 4 + int(Input.is_action_pressed("ui_left")) * -4, 
	int(Input.is_action_pressed("ui_down")) * 4 + int(Input.is_action_pressed("ui_up")) * -4));

	
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

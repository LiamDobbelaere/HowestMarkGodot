extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const COLOR_PINK = "#ec008c"
const COLOR_YELLOW = "#fff200";
const COLOR_BLUE = "#44c8f4";
const OPTIONS = ["[Physics 2D]", "BallMark", "BoxMark", "PolyMark", "[Physics 3D]", "BallMark3D", "BoxMark3D", "[Rendering]", "Stress2D", "Stress3D", "Stress3DUnlit", "[Logic]", "ZylannMicroHM"];
var UNTOUCHABLE = [];
var index = -1;

func _ready():
	for arg in OS.get_cmdline_args():
		if arg.substr(0, 6) == "-test=":
			var test = arg.split('=')[1];
			get_tree().change_scene("res://assets/scenes/%s.tscn" % [test])
			
	for x in range(0, len(OPTIONS)):
		if OPTIONS[x].substr(0, 1) == "[":
			UNTOUCHABLE.append(x);
	
	menu_select_next();
	redraw_menu();

	pass

func redraw_menu():
	var bbcode = "[color=%s]Howest[/color][color=%s]mark[/color] Godot\n" % [COLOR_BLUE, COLOR_PINK];
	bbcode += "----------------\n";

	for i in range(0, len(OPTIONS)):
		if i == index:
			bbcode += "[color=%s] %s[/color]\n" % [COLOR_YELLOW, OPTIONS[i]];
		else:
			if i in UNTOUCHABLE:
				bbcode += "[color=%s]%s[/color]\n" % [COLOR_BLUE, OPTIONS[i]];
			else:
				bbcode += "%s\n" % [OPTIONS[i]];	
			
	set_bbcode(bbcode);

func menu_select_next():
	index += 1;
	if index >= len(OPTIONS):
			index = 0;
	
	if index in UNTOUCHABLE:
		menu_select_next();	

func menu_select_previous():
	index -= 1;
	if index < 0:
		index = len(OPTIONS) - 1;
	
	if index in UNTOUCHABLE:
		menu_select_previous();	
		
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		menu_select_next();
		redraw_menu();
		
	if Input.is_action_just_pressed("ui_up"):
		menu_select_previous();
		redraw_menu();
		
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://assets/scenes/%s.tscn" % [OPTIONS[index]])
	
	pass


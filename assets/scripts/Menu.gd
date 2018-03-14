extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const COLOR_PINK = "#ec008c"
const COLOR_YELLOW = "#fff200";
const COLOR_BLUE = "#44c8f4";
const OPTIONS = ["First option", "Second option", "toby", "hallo", "test"];

var index = 0;

func _ready():
	redraw_menu();

	pass

func redraw_menu():
	var bbcode = "[color=%s]Howest[/color][color=%s]mark[/color] Godot\n" % [COLOR_BLUE, COLOR_PINK];
	bbcode += "----------------\n";

	for i in range(0, len(OPTIONS)):
		if i == index:
			bbcode += "[color=%s] %s[/color]\n" % [COLOR_YELLOW, OPTIONS[i]];
		else:
			bbcode += "%s\n" % [OPTIONS[i]];
		
	set_bbcode(bbcode);
		
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		index += 1;
		if index >= len(OPTIONS):
			index = 0;
		redraw_menu();
	
	if Input.is_action_just_pressed("ui_up"):
		index -= 1;
		if index < 0:
			index = len(OPTIONS) - 1;
		redraw_menu();
	
	pass


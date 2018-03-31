extends TileMap

export(PackedScene) var block

var tile_data;

var width = 512;
var height = 512;

var vx = 0;
var vy = 0;

func _ready():
	print("int %s divided by float %s is %s" % [8, 3.0, 8 / 3.0])
			
	randomize();
	
	tile_data = [];
	
	var x = 0;
	while x < width:
		tile_data.append([]);
		var y = 0;
		while y < height:
			tile_data[x].append(0);
			y += 1;
		x += 1;
	
	#brush_circle(16, 16, 8, 1, false);
	base_terrain(1, 0.8);
	random_caves();
	spawn_terrain();
	
	pass

func base_terrain(erosion, period):
	var tendency = 0;
	var max_stray = 64.0;
	var yy = height / 2;
	
	var x = 0;
	while x < width:
		tendency += rand_range(-erosion, erosion);
		yy += sin(tendency * period);
		
		if (yy < height / 2 - max_stray):
			tendency += 1;
		if (yy > height / 2 + max_stray):
			tendency -= 1;
			
		var y = height - 1;
		while y > yy:
			tile_data[x][y] = 1;
			y -= 1;
		
		x += 1;
		
func brush_circle(ox, oy, r, type, erode):
	var x = -r;
	while x < r:
		var h = sqrt(r * r - x * x);
		
		if erode:
			h += rand_range(-1, 2);
			
		var y = -h;
		while y < h:
			var ax = x + ox;
			var ay = y + oy;
			
			if erode and y < -h + 4 and y > h - 4:
				ax += rand_range(-2, 3);
				ay += rand_range(-2, 3);
			
			ax = int(clamp(ax, 0.0, width - 1.0));
			ay = int(clamp(ay, 0.0, height - 1.0));
			
			tile_data[ax][ay] = type;
			
			y += 1;
		x += 1;

func random_cave():
	var random_x = int(rand_range(0, width - 1));
	var ground_y = find_ground_y(random_x);
	var start_ground_y = ground_y;
	var angle = 0;
	var life = 0;
	var max_life = height / 1.5;
	var r = 3;
	
	while ground_y < height and life < max_life:
		brush_circle(random_x, ground_y, r, 0, false);
		
		angle = rand_range(270 - 45, 270 + 45);
		
		random_x += int(sin(angle) * r);
		if ground_y > start_ground_y + 64:
			ground_y += int(cos(angle / 2.0) * r);
		else:
			ground_y += 1;
		life += 1;
	
	brush_circle(random_x, ground_y, rand_range(8, 16), 0, false);	

func random_caves():
	var cave_count = 8
	
	var i = 0;
	while i < cave_count:
		random_cave();
		i += 1;

func find_ground_y(x):
	var y = 0;
	
	while y < height - 1:
		if tile_data[x][y] > 0: 
			return y;
		y += 1;
	
	return height - 1;

func spawn_terrain():	
	var x = 0;
	while x < width:
		var y = 0;
		while y < height:
			var tile = tile_data[x][y]
			
			if tile_data[x][y] > 0:
				set_cell(x, y, 0);
			y += 1;
		x += 1;
	
	pass
extends Node2D

# This is an adaptation of Zylann's microtests for GDScript
#
# The most noticeable difference is that while loops are used
# instead of for loops (because of array pre-allocation of range())
# 
# From every test, the time a while loop takes is subtracted
#
# Another change compared to Zylann's test is that all tests are
# executed 10 times, because there is too big of a difference without
# taking the average of multiple runs.

const ITERATIONS = 500000
const AVG_TIMES = 10

var chronometer = load('res://assets/scripts/Chronometer.gd').new();
var while_time = 0;

# Stuff used in tests {
var _member_var = 1

func _empty_void_function():
	pass
# } Stuff used in tests

func _ready():
	var test_while_loop = 0;
	var test_empty_func = 0;
	var test_increment = 0;
	var test_increment_x5 = 0;
	var test_increment_with_member_var = 0;
	var test_increment_with_local_outside_loop = 0;
	var test_increment_with_local_inside_loop = 0;
	var test_increment_vector2 = 0;
	var test_increment_vector3 = 0;
	var test_increment_vector3_constant = 0;
	var test_increment_vector3_individual_xyz = 0;
	var test_unused_local = 0;
	var test_divide = 0;
	var test_increment_with_array_member = 0;
	var test_if_true = 0;
	var test_if_true_else = 0;
	
	var avg_count = 0;
	while avg_count < AVG_TIMES:
		test_while_loop += test_while_loop();
		test_empty_func += test_empty_func();
		test_increment += test_increment();
		test_increment_x5 += test_increment_x5();
		test_increment_with_member_var += test_increment_with_member_var();
		test_increment_with_local_outside_loop += test_increment_with_local_outside_loop();
		test_increment_with_local_inside_loop += test_increment_with_local_inside_loop();
		test_increment_vector2 += test_increment_vector2();
		test_increment_vector3 += test_increment_vector3();
		test_increment_vector3_constant += test_increment_vector3_constant();
		test_increment_vector3_individual_xyz += test_increment_vector3_individual_xyz();
		test_unused_local += test_unused_local();
		test_divide += test_divide();
		test_increment_with_array_member += test_increment_with_array_member();
		test_if_true += test_if_true();
		test_if_true_else += test_if_true_else();		
		avg_count += 1;

	test_while_loop /= AVG_TIMES;
	test_empty_func /= AVG_TIMES;
	test_increment /= AVG_TIMES;
	test_increment_x5 /= AVG_TIMES;
	test_increment_with_member_var /= AVG_TIMES;
	test_increment_with_local_outside_loop /= AVG_TIMES;
	test_increment_with_local_inside_loop /= AVG_TIMES;
	test_increment_vector2 /= AVG_TIMES;
	test_increment_vector3 /= AVG_TIMES;
	test_increment_vector3_constant /= AVG_TIMES;
	test_increment_vector3_individual_xyz /= AVG_TIMES;
	test_unused_local /= AVG_TIMES;
	test_divide /= AVG_TIMES;
	test_increment_with_array_member /= AVG_TIMES;
	test_if_true /= AVG_TIMES;
	test_if_true_else /= AVG_TIMES;
	
	print("bench test_while_loop, %s\r" % [test_while_loop]);
	print("bench test_empty_func, %s\r" % [test_empty_func]);
	print("bench test_increment, %s\r" % [test_increment]);
	print("bench test_increment_x5, %s\r" % [test_increment_x5]);
	print("bench test_increment_with_member_var, %s\r" % [test_increment_with_member_var]);
	print("bench test_increment_with_local_outside_loop, %s\r" % [test_increment_with_local_outside_loop]);
	print("bench test_increment_with_local_inside_loop, %s\r" % [test_increment_with_local_inside_loop]);
	print("bench test_increment_vector2, %s\r" % [test_increment_vector2]);
	print("bench test_increment_vector3, %s\r" % [test_increment_vector3]);
	print("bench test_increment_vector3_constant, %s\r" % [test_increment_vector3_constant]);
	print("bench test_increment_vector3_individual_xyz, %s\r" % [test_increment_vector3_individual_xyz]);
	print("bench test_unused_local, %s\r" % [test_unused_local]);
	print("bench test_divide, %s\r" % [test_divide]);
	print("bench test_increment_with_array_member, %s\r" % [test_increment_with_array_member]);
	print("bench test_if_true, %s\r" % [test_if_true]);
	print("bench test_if_true_else, %s\r" % [test_if_true_else]);
	
	pass

#-------------------------------------------------------------------------------
func test_while_loop():
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		i += 1;
		pass
		
	while_time = chronometer.stop();
	
	return while_time;

#-------------------------------------------------------------------------------
func test_empty_func():
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		_empty_void_function();
		i += 1;
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment():
	var a = 0
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += 1;
		i += 1;
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_x5():
	var a = 0
	
	chronometer.start();

	var i = 0;
	while i < ITERATIONS:	
		a += 1;
		a += 1;
		a += 1;
		a += 1;
		a += 1;
		i += 1;
	
	return chronometer.stop() - while_time;
	
#-------------------------------------------------------------------------------
func test_increment_with_member_var():
	var a = 0
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += _member_var;
		i += 1
	
	return chronometer.stop() - while_time;
	
#-------------------------------------------------------------------------------
func test_increment_with_local_outside_loop():
	var a = 0
	var b = 1
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += b
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_with_local_inside_loop():
	var a = 0
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		var b = 1
		a += b
		i += 1
	
	return chronometer.stop() - while_time;
	
#-------------------------------------------------------------------------------
func test_increment_vector2():
	var a = Vector2(0,0)
	var b = Vector2(1,1)
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += b
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_vector3():
	var a = Vector3(0,0,0)
	var b = Vector3(1,1,1)
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += b
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_vector3_constant():
	var a = Vector3(0,0,0)
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a += Vector3(1,1,1)
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_vector3_individual_xyz():
	var a = Vector3(0,0,0)
	var b = Vector3(1,1,1)
	
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		a.x += b.x
		a.y += b.y
		a.z += b.z
		i += 1
	
	return chronometer.stop() - while_time;
	
#-------------------------------------------------------------------------------
func test_unused_local():
	chronometer.start();
	
	var i = 0;
	while i < ITERATIONS:
		var b = 1
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_divide():
	chronometer.start();
	
	var a = 9999
	var i = 0;
	while i < ITERATIONS:
		a /= 1.01
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_increment_with_array_member():
	chronometer.start();
	
	var a = 0
	var arr = [1]
	var i = 0;
	while i < ITERATIONS:
		a += arr[0]
		i += 1
	
	return chronometer.stop() - while_time;
	
#-------------------------------------------------------------------------------
func test_if_true():
	chronometer.start();
	var i = 0;
	while i < ITERATIONS:
		if true:
			pass
		i += 1
	
	return chronometer.stop() - while_time;

#-------------------------------------------------------------------------------
func test_if_true_else():
	chronometer.start();
	var i = 0;
	while i < ITERATIONS:
		if true:
			pass
		else:
			pass
		i += 1
	
	return chronometer.stop() - while_time;
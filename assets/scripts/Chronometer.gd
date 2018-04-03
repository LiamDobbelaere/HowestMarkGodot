var start_time;

func start():
	start_time = OS.get_ticks_msec();
	
func stop():
	return OS.get_ticks_msec() - start_time;
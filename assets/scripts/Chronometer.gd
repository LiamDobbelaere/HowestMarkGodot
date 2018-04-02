var start_time;

func start():
	start_time = OS.get_ticks_usec();
	
func stop():
	return OS.get_ticks_usec() - start_time;
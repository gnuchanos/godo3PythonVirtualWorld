extends Control







func _process(_delta):
	$fps.text = "FPS: " + str(Engine.get_frames_per_second())

	var now = OS.get_time()
	var second = now.second
	var minute = now.minute
	var hour = now.hour
	var mytime = str(hour) + ":" + str(minute) + ":" + str(second)

	var dateDict = OS.get_date()
	var day = dateDict["day"]
	var month = dateDict["month"]
	var year = dateDict["year"]
	var cal = str(day) + ":" + str(month) + ":" + str(year)
	$topBar/HBoxContainer/systenInfo/systemInfoSTRING.text = cal + " | " + mytime


	$info/shortcut.text = """
	( Terminal ) - Alt+Enter
	( Text Editor ) - 
	( Calculator ) - 
	( Timer ) - 
	( Alarm ) -


	"""

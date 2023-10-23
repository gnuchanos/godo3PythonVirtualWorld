extends WindowDialog

onready var debug = $Panel/VBoxContainer/debug
onready var input = $Panel/VBoxContainer/input



func _process(_delta):
	if Input.is_action_just_pressed("altEnter"):
		globalVAR.userSettings["WindowMode"] = true
		self.visible = true
		input.grab_focus()

	if not self.visible:
		globalVAR.userSettings["WindowMode"] = false
	if Input.is_action_just_pressed("enter"):
		debug.text += input.text + "\n"

		if "tardis start" == input.text:
			globalVAR.userSettings["tardisON"] = true
			self.hide()







		input.text = ""

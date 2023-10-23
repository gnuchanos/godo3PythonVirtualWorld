extends WindowDialog



func _process(delta):
	if Input.is_action_just_pressed("altEnter"):
		self.popup_centered()

func _ready():
	set_process_input(true)


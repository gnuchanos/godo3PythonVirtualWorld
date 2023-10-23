from godot import exposed, export
from godot import *


@exposed
class panel(Panel):
	userName = export(str)
	def _ready(self):
		pass
	def _process(self, delta):
		pass
	def _testButton_signal(self):
		self.userName = self.get_node("VBoxContainer/userName")
		print(self.userName.text)




from godot import exposed, export
from godot import *
import psutil

@exposed
class center(Panel):
	#a = export(int)
	real_ram = export(float)
	used_ram = export(float)
	cpu_freq = export(float)
	cpu_percent = export(float)
	cpu_temperature = export(int)
	time = export(int)

	def _ready(self):
		self.time = 0.5
	def _process(self, delta):
		systemString = self.get_node("system")
		if self.time >= 0:
			self.time -= delta
		else:
			self.real_ram = psutil.virtual_memory().total / (1024 ** 2)
			self.used_ram = psutil.virtual_memory().used / (1024 ** 2)
			self.cpu_temperature = psutil.sensors_temperatures().get('coretemp', None)
			self.cpu_freq = psutil.cpu_freq()
			self.cpu_percent = psutil.cpu_percent() #interval=1 this is kill fps
			systemString.text = f"Temp: {self.cpu_temperature[0].current}°C | Cpu: {int(self.cpu_freq.current)}Ghz {int(self.cpu_percent)}% | Ram:{int(self.used_ram)}M/{int(self.real_ram)}M"
			self.time = 0.5

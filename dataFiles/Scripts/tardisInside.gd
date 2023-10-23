extends Spatial

var zSpace = rand_range(-.15, .15)
var ySpace = rand_range(-.15, .15)
var xSpace = rand_range(-.15, .15)
var second = 0
var travelTimer = 0
var soundPlay = false

func _ready():
	$Camera.translation.z = 11.174
	$Camera.translation.y = 3.16

func _process(delta):
	if globalVAR.userSettings["tardisON"] == true:
		if travelTimer <= 29:
			if not soundPlay:
				soundPlay = true
				$travelSound.play()
			travelTimer += 1 * delta
			$b2.rotate_y(.9*delta)
			$b3.rotate_y(-.65*delta)
			$b4.rotate_y(.5*delta)
			$b5.rotate_y(-.25*delta)
			$Camera.translation.z += 1 * delta
			$Camera.translation.y += 1 * delta
			$Camera.translation.z = clamp($Camera.translation.z, 3.16, 24.849)
			$Camera.translation.y = clamp($Camera.translation.y, 11.174, 14.641)
		else:
			$Camera.translation.z -= 1 * delta
			$Camera.translation.y -= 1 * delta
			globalVAR.userSettings["tardisON"] = false
			travelTimer = 0
			soundPlay = false
	else:
		if $Camera.translation.z >= 11.174:
			$Camera.translation.z -= 1 * delta
		if $Camera.translation.y >= 3.16:
			$Camera.translation.y -= 1 * delta

	if second <= 5:
		second += 1 * delta
	else:
		zSpace = rand_range(-.15, .15)
		ySpace = rand_range(-.20, .20)
		xSpace = rand_range(-.25, .25)
		second = 0


	$a1.rotate_y(zSpace*delta)
	$a2.rotate_y(ySpace*delta)
	$a3.rotate_y(xSpace*delta)

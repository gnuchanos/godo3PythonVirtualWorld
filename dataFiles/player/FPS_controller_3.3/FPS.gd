extends KinematicBody

var speed = 3
const ACCEL_DEFAULT = 7
const ACCEL_AIR = 1
onready var accel = ACCEL_DEFAULT
var gravity = 9.8
var jump = 5

var cam_accel = 40
var mouse_sense = 0.1
var snap

var direction = Vector3()
var velocity = Vector3()
var gravity_vec = Vector3()
var movement = Vector3()

var mouseHide = false
var f_input = Input.get_action_strength("w") - Input.get_action_strength("s")
var h_input = Input.get_action_strength("d") - Input.get_action_strength("a")


func _input(event):
	#get mouse input for camera rotation
	if mouseHide:
		if event is InputEventMouseMotion:
			rotate_y(deg2rad(-event.relative.x * mouse_sense))

func _process(delta):
	$gnuchanos_ch_purple/rotateY.rotate_y(20*delta)
	if Input.is_action_just_pressed("esc"):
		if not mouseHide:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			mouseHide = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			mouseHide = false

	if Input.is_action_pressed("q"):
		$gnuchanos_ch_purple/AnimationPlayer.play("idl_tablet_loop")
	elif Input.is_action_pressed("e"):
		$gnuchanos_ch_purple/AnimationPlayer.play("idl_think_loop")
	else:
		$gnuchanos_ch_purple/AnimationPlayer.play("idl_loop")

func _physics_process(delta):
	#get keyboard input
	direction = Vector3.ZERO
	var h_rot = global_transform.basis.get_euler().y
	if mouseHide:
		f_input = Input.get_action_strength("w") - Input.get_action_strength("s")
		h_input = Input.get_action_strength("a") - Input.get_action_strength("d")
	else:
		if globalVAR.userSettings["WindowMode"] != true:
			f_input = Input.get_action_strength("w") - Input.get_action_strength("s")
			h_input = Input.get_action_strength("d") - Input.get_action_strength("a")
			speed = 3
		else:
			speed = 0
	direction = Vector3(h_input, 0, f_input).rotated(Vector3.UP, h_rot).normalized()

	#jumping and gravity
	if is_on_floor():
		snap = -get_floor_normal()
		accel = ACCEL_DEFAULT
		gravity_vec = Vector3.ZERO
	else:
		snap = Vector3.DOWN
		accel = ACCEL_AIR
		gravity_vec += Vector3.DOWN * gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		snap = Vector3.ZERO
		gravity_vec = Vector3.UP * jump

	#make it move
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	movement = velocity + gravity_vec
	move_and_slide_with_snap(movement, snap, Vector3.UP)

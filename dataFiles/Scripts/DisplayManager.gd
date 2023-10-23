extends Control

onready var userName = $Panel3/VBoxContainer/userName
onready var userPassword = $Panel3/VBoxContainer/userPassword

func _ready():
	userName.grab_focus()

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		if userName.text != "" and userPassword.text != "":
			get_tree().change_scene("res://dataFiles/Programs/WindowManager.tscn")

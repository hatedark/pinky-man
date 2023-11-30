extends Node2D

@onready var pink_man = $"Pink Man"

var gravitasi = 0

func _on_area_2d_body_entered(body):
	if body:
		get_tree().change_scene_to_file("res://Scene/map_rotasi.tscn")

func rotasi(args, delta):
	if args == "left":
		pink_man.rotate(-PI/2)
	elif args == "right":
		pink_man.rotate(PI/2)

func _process(_delta):
	var rotating_left = Input.is_action_just_pressed("rotate_left")
	var rotating_right = Input.is_action_just_pressed("rotate_right")
	
	if rotating_left:
		rotasi("left", _delta)
	elif rotating_right:
		rotasi("right", _delta)

extends Node2D

@onready var sprite_2d = $"../Sprite2D"
@onready var blank = $".."

@export var x = 23
@export var y = -37
@export var derajat = PI/2
var xb = null
var yb = null
var toogle = true

func translation():
	print("Sebelum | (x, y) : ", position)
	print("Translasi ", Vector2(x, y))
	
	position += Vector2(x, y)
	
	print("Sesudah | (x, y) : ", position)
	print("-------------------------------------------")

func rotation(args):
	print("Sebelum | (x, y) : ", position)
	
	if args == "clockwise":
		xb = position.x-sprite_2d.position.x
		yb = position.y-sprite_2d.position.y
		x = (xb*cos(derajat)+yb*sin(derajat))+sprite_2d.position.x
		y = (xb*-sin(derajat)+yb*cos(derajat))+sprite_2d.position.y
	elif args == "counterclockwise":
		xb = position.x-sprite_2d.position.x
		yb = position.y-sprite_2d.position.y
		x = (xb*cos(derajat)+yb*-sin(derajat))+sprite_2d.position.x
		y = (xb*sin(derajat)+yb*cos(derajat))+sprite_2d.position.y
	
	position = Vector2(x, y)
	
	print("Rotasi ", Vector2(x, y), " 90 derajat pada pusat ", sprite_2d.position)
	print("Sesudah | (x, y) : ", position)
	print("-------------------------------------------")

func mirroring(args):
	print("Sebelum | (x, y) : ", position)
	
	if args == "x":
		print("Pencerminan terhadap sumbu x")
		x = position.x
		y = (position.y-sprite_2d.position.y)*-1+sprite_2d.position.y
	elif args == "y":
		print("Pencerminan terhadap sumbu y")
		x = (position.x-sprite_2d.position.x)*-1+sprite_2d.position.x
		y = position.y
	
	position = Vector2(x, y)
	
	print("Sesudah | (x, y) : ", position)
	print("-------------------------------------------")
	
func scaling(args):
	print("Sebelum | ", scale)
	if args == "up":
		scale += Vector2(1, 1)
	elif args == "down":
		scale -= Vector2(1, 1)
	
	print("Sesudah | ", scale)
	
func skewing(args):
	if args == "up":
		skew += PI/6
	elif args == "down":
		skew -= PI/6

func movement():
	var x_axis = Input.get_axis("left", "right")
	var y_axis = Input.get_axis("up", "down")
	var input = Vector2(x_axis, y_axis)
	
	position += input

func _process(_delta):
	if blank.toogle == "pink_man":
		movement()
		var translating = Input.is_action_just_pressed("special")
		var rotate_clockwise = Input.is_action_just_pressed("rotate_left")
		var rotate_counterclockwise = Input.is_action_just_pressed("rotate_right")
		var mirror_x = Input.is_action_just_pressed("mirror_x")
		var mirror_y = Input.is_action_just_pressed("mirror_y")
		var scale_up = Input.is_action_just_pressed("scale_up")
		var scale_down = Input.is_action_just_pressed("scale_down")
		var skewing_up = Input.is_action_just_pressed("skewing_up") 
		var skewing_down = Input.is_action_just_pressed("skewing_down") 

		if translating:
			translation()
		elif rotate_clockwise:
			rotation("clockwise")
		elif rotate_counterclockwise:
			rotation("counterclockwise")
		elif mirror_x:
			mirroring("x")
		elif mirror_y:
			mirroring("y")
		elif scale_up:
			scaling("up")
		elif scale_down:
			scaling("down")
		elif skewing_up:
			skewing("up")
		elif skewing_down:
			skewing("down")
			
		if Input.is_action_just_pressed("special2"):
			print(position)
	else:
		pass

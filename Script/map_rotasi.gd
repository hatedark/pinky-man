extends Node2D

@onready var pink_man = $PinkMan
@onready var pusat = $Pusat

@export var degree = PI
var go_rotate = false

func _process(delta):
	if Input.is_action_just_pressed("special"):
		go_rotate = false
	elif Input.is_action_just_pressed("q"):
		print("Hi")
	

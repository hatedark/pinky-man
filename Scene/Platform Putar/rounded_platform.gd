extends Node2D

@onready var platform = $Platform
@onready var pusat = $Pusat

@export var x = 20
@export var y = 20
@export var derajat = PI/180
var xb = null
var yb = null

func _physics_process(delta):
	xb = platform.position.x-pusat.position.x
	yb = platform.position.y-pusat.position.y
	x = (xb*cos(derajat)+yb*sin(derajat))+pusat.position.x
	y = (xb*-sin(derajat)+yb*cos(derajat))+pusat.position.y

	platform.position = Vector2(x, y)

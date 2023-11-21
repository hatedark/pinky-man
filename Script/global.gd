extends Node2D

@onready var character_body_2d = $CharacterBody2D
@onready var sprite_2d = $Sprite2D
@onready var animated_sprite_2d = $CharacterBody2D/AnimatedSprite2D
@onready var phantom_camera_2d = $PhantomCamera2D
@onready var camera_2d = $Camera2D

var rotate_on = false
var x = null
var y = null
var xb = null
var yb = null
var degree = PI/2
var run = false

func _ready():
	phantom_camera_2d.position.x = -500
	character_body_2d.velocity.y = 0

func _process(delta):
	if rotate_on:
		character_body_2d.velocity.y = 0
		character_body_2d.position = Vector2(
		move_toward(character_body_2d.position.x, x, 10), 
		move_toward(character_body_2d.position.y, y, 10)
		)
		if character_body_2d.position.x == x and character_body_2d.position.y == y:
			rotate_on = false
	
	if Input.is_action_just_pressed("special"):
		animated_sprite_2d.animation = "run"
		phantom_camera_2d.set_follow_target_node($Sprite2D)
		run = true
	elif run:
		character_body_2d.position.x += 400 * delta

func _on_button_pressed():
	character_body_2d.scale.x += 1
	character_body_2d.scale.y += 1


func _on_rotate_pressed():
	print(sprite_2d.position)
	print(character_body_2d.position)
	
	xb = character_body_2d.position.x-sprite_2d.position.x
	yb = character_body_2d.position.y-sprite_2d.position.y
	x = (xb*cos(degree)+yb*-sin(degree))+sprite_2d.position.x
	y = (xb*sin(degree)+yb*cos(degree))+sprite_2d.position.y
	
	rotate_on = true

	print("x :", x)
	print("y :", y)
	

func _on_mirror_pressed():
	print(sprite_2d.position)
	print(character_body_2d.position)
	
	x = (character_body_2d.position.x-sprite_2d.position.x)*-1+sprite_2d.position.x
	y = character_body_2d.position.y
	
	rotate_on = true
	
	print("x :", x)
	print("y :", y)


func _on_skew_pressed():
	character_body_2d.skew += PI/6

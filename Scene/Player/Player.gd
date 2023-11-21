extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var sprite_2d = $Sprite2D
@onready var state_machine = $PlayerStateMachine
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 300.0
@export var double_jump_velocity = 375.0
@export var wall_slide_velocity = 200.0
@export var jump_velocity = 425.0

const MAX_JUMPS = 2

var jump_made = 0
var gravity = 980
var wall_sliding = false

func _ready():
	animation_tree.active = true

func idle_run():
	# Pergerakan Karakter Kiri Kanan
	var direction = Input.get_axis("left", "right")
	if direction && state_machine.check_if_can_move():
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, 60)
		
	# Animasi
	if direction > 0:
		sprite_2d.flip_h = false
	elif direction < 0:
		sprite_2d.flip_h = true
	animation_tree.set("parameters/Move/blend_position", direction)
		


func jump_gravity(delta):
	# Gravitasi
	velocity.y += gravity * delta
	
	# Pergerakan Karakter Melompat dan Animasi
	var is_jumping = Input.is_action_just_pressed("jump") and is_on_floor()
	var is_double_jumping = Input.is_action_just_pressed("jump")
	var is_falling = velocity.y > 0.0 and not is_on_floor()
	if is_jumping:
		animated_sprite_2d.animation = "jump"
		jump_made += 1
		velocity.y = -jump_velocity
	elif is_double_jumping:
		jump_made += 1
		if jump_made == MAX_JUMPS:
			velocity.y = -double_jump_velocity
			animated_sprite_2d.animation = "double_jump"
	elif is_falling:
		pass
		animated_sprite_2d.animation = "fall"
	elif is_on_floor():
		jump_made = 0


func _physics_process(delta):
	move_and_slide()
	idle_run()
	jump_gravity(delta)
	

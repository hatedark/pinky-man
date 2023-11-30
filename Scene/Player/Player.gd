extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var sprite_2d = $Sprite2D
@onready var state_machine = $PlayerStateMachine

@export var stage: Node2D
@export var speed = 300.0
@export var wall_slide_velocity = 200.0

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


func _physics_process(delta):
	move_and_slide()
	idle_run()

func _on_RoomDetector_area_entered(area: Area2D) -> void:
	# Gets collision shape and size of room
	var collision_shape: CollisionShape2D = area.get_node("CollisionShape2D")
	var size: Vector2 = collision_shape.shape.extents * 2
 
	# Changes camera's current room and size. check camera script for more info
	stage.change_room(collision_shape.global_position, size)

extends RigidBody2D

@export var jump_force: float = 600
@export var char: CharacterBody2D

func _on_area_2d_body_entered(body):
	if body:
		char.velocity.y = -jump_force

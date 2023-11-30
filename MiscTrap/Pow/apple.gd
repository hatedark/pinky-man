extends Area2D

@export var character: CharacterBody2D

func _on_body_entered(body):
	character.scale -= Vector2(1, 1)
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)

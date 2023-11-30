extends Node2D

@export var restart: String

func _on_area_2d_body_entered(body):
	if body:
		print("hi")
		get_tree().change_scene_to_file(restart)

extends Control

@export var animation: AnimationPlayer
@export var next_scene = "res://Map/Stage Translasi/stage_translasi.tscn"
@export var dev_mode = "res://Map/DevMode/blank.tscn"

func _ready():
	animation.play("Menu")

func _on_start_pressed():
	get_tree().change_scene_to_file(next_scene)


func _on_end_pressed():
	get_tree().quit()


func _on_free_mode_pressed():
	get_tree().change_scene_to_file(dev_mode)

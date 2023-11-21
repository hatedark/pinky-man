extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scene/map_1.tscn")


func _on_end_pressed():
	get_tree().quit()


func _on_free_mode_pressed():
	get_tree().change_scene_to_file("res://Scene/blank.tscn")

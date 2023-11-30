extends Node2D

@onready var rectangle = $Rectangle
@onready var pink_man = $"Pink Man"

var toogle:String = "pink_man"

func _on_check_button_toggled(button_pressed):
	if button_pressed:
		rectangle.visible = true
		pink_man.visible = false
		toogle = "rectangle"
	else:
		rectangle.visible = false
		pink_man.visible = true
		toogle = "pink_man"

extends Line2D

@onready var blank = $"../.."

var point_1 = get_point_position(0)
var point_2 = get_point_position(1)
var point_3 = get_point_position(2)
var point_4 = get_point_position(3)

func scaling(args):
	print("Sebelum |",
	"\n\tPoin 1: ", get_point_position(0),
	"\tPoin 2: ", get_point_position(1),
	"\tPoin 3: ", get_point_position(2),
	"\tPoin 4: ", get_point_position(3),
	"\n\tScale: ", scale)
	if args == "up":
		scale += Vector2(1, 1)
		print("Sesudah | Scale :", scale)
		print("---------------------------------------------------------------")
	if args == "1":
		var scalingkan = get_point_position(0)*2
		set_point_position(0, scalingkan)
		print("Sesudah | Poin 1 ", get_point_position(0))
		print("---------------------------------------------------------------")
	if args == "2":
		var scalingkan = get_point_position(1)*2
		set_point_position(1, scalingkan)
		print("Sesudah | Poin 2: ", get_point_position(1))
		print("---------------------------------------------------------------")
	if args == "3":
		var scalingkan = get_point_position(2)*2
		set_point_position(2, scalingkan)
		print("Sesudah | Poin 3: ", get_point_position(2))
		print("---------------------------------------------------------------")
	if args == "4":
		var scalingkan = get_point_position(3)*2
		set_point_position(3, scalingkan)
		print("Sesudah | Poin 4: ", get_point_position(3))
		print("---------------------------------------------------------------")
	elif args == "down":
		scale = Vector2(1, 1)
		set_point_position(0, point_1)
		set_point_position(1, point_2)
		set_point_position(2, point_3)
		set_point_position(3, point_4)
		print("Sesudah |",
		"\n\tPoin 1: ", get_point_position(0),
		"\tPoin 2: ", get_point_position(1),
		"\tPoin 3: ", get_point_position(2),
		"\tPoin 4: ", get_point_position(3),
		"\n\tScale: ", scale)
		print("---------------------------------------------------------------")
		
		
func skewing(args):
	if args == "up":
		skew += PI/6
	elif args == "down":
		skew -= PI/6
		
		
func _process(_delta):
	if blank.toogle == "rectangle":
		var scale_up = Input.is_action_just_pressed("scale_up")
		var scale_point_1 = Input.is_action_just_pressed("1")
		var scale_point_2 = Input.is_action_just_pressed("2")
		var scale_point_3 = Input.is_action_just_pressed("3")
		var scale_point_4 = Input.is_action_just_pressed("4")
		var scale_reset = Input.is_action_just_pressed("scale_down")
		var skewing_up = Input.is_action_just_pressed("skewing_up")
		var skewing_down = Input.is_action_just_pressed("skewing_down")

		if scale_up:
			scaling("up")
		elif scale_point_1:
			scaling("1")
		elif scale_point_2:
			scaling("2")
		elif scale_point_3:
			scaling("3")
		elif scale_point_4:
			scaling("4")
		elif scale_reset:
			scaling("down")
		elif skewing_up:
			skewing("up")
		elif skewing_down:
			skewing("down")
	else:
		pass

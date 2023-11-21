extends Node

class_name PlayerStateMachine

@export var PLAYER: CharacterBody2D
@export var CURRENT_STATE: StateMachine
var states: Array[StateMachine]

func _ready():
	for child in get_children():
		if child is StateMachine:
			states.append(child)
			
			# Set the states up with what they need to function
			child.PLAYER = PLAYER
			
		else:
			push_warning("Child ", child.name, " is not a State for PlayerStateMachine")

func _physics_process(delta):
	if CURRENT_STATE.NEXT_STATE != null:
		switch_state(CURRENT_STATE.NEXT_STATE)
		
	CURRENT_STATE.state_process(delta)

func check_if_can_move():
	return CURRENT_STATE.can_move

func switch_state(new_state: StateMachine):
	if CURRENT_STATE != null:
		CURRENT_STATE.on_exit()
		CURRENT_STATE.NEXT_STATE = null
		
	CURRENT_STATE = new_state
	
	CURRENT_STATE.on_enter()

func _input(event: InputEvent):
	CURRENT_STATE.state_input(event)

extends StateMachine

class_name AirPlayerState

@export var ground_state: StateMachine
@export var idling: String = "Move"
@export var falling: String = "fall"
@export var double_jumping: String = "double_jump"
@export var double_jump_velocity: float = 375.0
@export var gravity: float = 980.0

var has_double_jumped = false

func state_process(delta):
	PLAYER.velocity.y += gravity * delta
	
	if PLAYER.velocity.y > 0 && !PLAYER.is_on_floor():
		playback.travel(falling)
	elif PLAYER.is_on_floor():
		NEXT_STATE = ground_state
		playback.travel(idling)
		
func state_input(event: InputEvent):
	if event.is_action_pressed("jump") && !has_double_jumped:
		double_jump()
		
func on_exit():
	if NEXT_STATE == ground_state:
		has_double_jumped = false

func double_jump():
	PLAYER.velocity.y = -double_jump_velocity
	playback.travel(double_jumping)
	
	has_double_jumped = true

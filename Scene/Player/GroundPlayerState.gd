extends StateMachine

class_name GroundPlayerState

@export var air_state: StateMachine
@export var jump_velocity: float = 475.0
@export var jump_animation: String = "jump"

func state_process(delta):
	if !PLAYER.is_on_floor():
		NEXT_STATE = air_state

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		jump()
		
func jump():
	PLAYER.velocity.y = -jump_velocity
	NEXT_STATE = air_state
	playback.travel(jump_animation)

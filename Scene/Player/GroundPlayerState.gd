extends StateMachine

class_name GroundPlayerState

@export var air_state: StateMachine
@export var jump_velocity = 475.0

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		jump()
		
func jump():
	PLAYER.velocity.y = -jump_velocity
	NEXT_STATE = air_state

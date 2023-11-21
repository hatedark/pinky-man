extends StateMachine

class_name AirPlayerState

@export var ground_state: StateMachine

func state_process(delta):
	if PLAYER.is_on_floor():
		NEXT_STATE = ground_state

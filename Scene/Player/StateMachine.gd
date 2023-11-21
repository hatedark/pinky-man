extends Node

class_name StateMachine

@export var can_move: bool = true
var PLAYER: CharacterBody2D
var NEXT_STATE: StateMachine

func state_process(delta):
	pass

func state_input(event: InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass

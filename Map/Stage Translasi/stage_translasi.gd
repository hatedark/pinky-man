extends Node2D

# Singleton which stores references to other Nodes
 
@export var player_camera: Camera2D
@export var platforming_player: CharacterBody2D
@onready var animation_player = $AnimationPlayer

var room_pause: bool = false
@export var room_pause_time: float = 0.2
 
enum {
	UP,
	RIGHT,
	DOWN,
	LEFT
}
 
func change_room(room_position: Vector2, room_size: Vector2) -> void:
	player_camera.current_room_center = room_position
	player_camera.current_room_size = room_size
 
	room_pause = true
	await get_tree().create_timer(room_pause_time).timeout
	room_pause = false


func _on_death_area_body_entered(body):
	get_tree().change_scene_to_file("res://Map/Stage Translasi/stage_translasi.tscn")

extends CharacterBody2D
class_name Player

@export var animation_tree: AnimationTree

@export var move_speed: float
var last_non_zero_vector: Vector2

@onready var animation_state: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")


func get_vector() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

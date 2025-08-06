class_name Actor
extends CharacterBody3D


var can_move = true: set = set_can_move


func set_can_move(value: bool) -> void:
	can_move = value
	if not can_move:
		velocity = Vector3.ZERO

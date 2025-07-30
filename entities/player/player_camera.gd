extends Node3D


@export var _target: Node3D
@export var _move_speed := 10.0


func _physics_process(delta: float) -> void:
	global_position = global_position.lerp(_target.global_position, _move_speed * delta)

extends Node3D


@export var _target: Node3D
@export var _move_speed := 10.0
@export var _snap_threshold := 5.0


func _physics_process(delta: float) -> void:
	if global_position.distance_to(_target.global_position) < _snap_threshold:
		global_position = global_position.lerp(_target.global_position, _move_speed * delta)
	else:
		global_position = _target.global_position

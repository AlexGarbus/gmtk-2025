extends CharacterBody3D


@export var _target: Node3D
@export var _min_target_distance := 1.0

var _move_speed := 5.0


func _ready() -> void:
	add_collision_exception_with(_target)


func _physics_process(delta: float) -> void:
	if _target.global_position.distance_to(global_position) <= _min_target_distance:
		return
	var direction := (_target.global_position - global_position).normalized()
	if direction:
		velocity.x = direction.x * _move_speed
		velocity.z = direction.z * _move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, _move_speed)
		velocity.z = move_toward(velocity.z, 0, _move_speed)
	move_and_slide()

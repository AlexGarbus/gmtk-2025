extends Actor


@export var _target: Node3D
@export var _min_target_distance := 1.0

var _move_speed := 5.0


func _ready() -> void:
	add_collision_exception_with(_target)


func _physics_process(_delta: float) -> void:
	if not can_move:
		return
	if _target.global_position.distance_to(global_position) <= _min_target_distance:
		velocity.x = move_toward(velocity.x, 0, _move_speed)
		velocity.z = move_toward(velocity.z, 0, _move_speed)
	else:
		var direction := (_target.global_position - global_position)
		direction = direction.normalized()
		velocity.x = direction.x * _move_speed
		velocity.z = direction.z * _move_speed
	move_and_slide()

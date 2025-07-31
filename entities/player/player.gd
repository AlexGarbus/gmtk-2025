class_name Player
extends CharacterBody3D


@export var move_speed := 5.0

@onready var partner := $"../Partner"
@onready var _world_detection := $WorldDetection

var can_move: bool
var _world_margin: float


func _ready() -> void:
	can_move = Dialogic.current_timeline == null
	_world_margin = _world_detection.position.length()
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)


func _physics_process(_delta: float) -> void:
	if not can_move:
		return
	_apply_input()
	_update_world_detection()
	if _world_detection.is_colliding():
		move_and_slide()


func _apply_input() -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		velocity.z = move_toward(velocity.z, 0, move_speed)


func _update_world_detection() -> void:
	_world_detection.position = velocity.normalized() * _world_margin
	_world_detection.force_raycast_update()


func _on_timeline_started() -> void:
	can_move = false


func _on_timeline_ended() -> void:
	can_move = true

extends StaticBody3D


@export var _flag := 0
@export var _invert_flag := false

@onready var _anim: AnimationPlayer = $AnimationPlayer
@onready var _collision_shape: CollisionShape3D = $CollisionShape3D

var _activated := true


func _ready() -> void:
	_activated = _is_flag_condition_met(UserData.flags.get_bit(_flag))
	_collision_shape.set_deferred("disabled", not _activated)
	_initialize_animation()
	UserData.flags.changed.connect(_on_flags_changed)


func _initialize_animation() -> void:
	if _activated:
		_anim.play("toggle")
	else:
		_anim.play_backwards("toggle")
	_anim.advance(0)
	_anim.pause()


func _is_flag_condition_met(flag_value: bool) -> bool:
	return flag_value and not _invert_flag or not flag_value and _invert_flag


func _on_flags_changed(bit: int, value: bool) -> void:
	if not _flag == bit:
		return
	if _activated == _is_flag_condition_met(value):
		return
	print("TOGGLE")
	_activated = not _activated
	_collision_shape.set_deferred("disabled", not _activated)
	if _activated:
		_anim.play_backwards("toggle")
	else:
		_anim.play("toggle")

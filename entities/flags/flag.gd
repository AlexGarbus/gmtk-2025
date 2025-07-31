extends Area3D


@export var _bit := 0

@onready var _anim: AnimationPlayer = $AnimationPlayer

var _can_interact := true


func _ready() -> void:
	UserData.flag_changed.connect(_on_flag_data_changed)
	_anim.play("on" if UserData.get_flag(_bit) else "off")


func _on_flag_data_changed(bit: int, value: bool) -> void:
	if not _bit == bit:
		return
	_anim.play("off_to_on" if value else "on_to_off")


func _on_body_entered(body: Node3D) -> void:
	if not _can_interact:
		return
	_can_interact = false
	UserData.set_flag(_bit, not UserData.get_flag(_bit))


func _on_body_exited(body: Node3D) -> void:
	_can_interact = true

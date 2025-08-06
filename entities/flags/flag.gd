extends Area3D


@export var _bit := 0

@onready var _anim: AnimationPlayer = $AnimationPlayer
@onready var _audio: AudioStreamPlayer = $AudioStreamPlayer

var _can_interact := true


func _ready() -> void:
	UserData.flags.changed.connect(_on_flags_changed)
	_anim.play("on" if UserData.flags.get_bit(_bit) else "off")


func _on_flags_changed(bit: int, value: bool) -> void:
	if not _bit == bit:
		return
	_anim.play("off_to_on" if value else "on_to_off")
	_audio.play()


func _on_body_entered(body: Node3D) -> void:
	if not _can_interact:
		return
	_can_interact = false
	UserData.flags.flip_bit(_bit)


func _on_body_exited(body: Node3D) -> void:
	_can_interact = true

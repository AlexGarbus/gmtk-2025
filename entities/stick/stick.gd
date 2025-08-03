extends Area3D


@export var _id := 0

@onready var _audio := $AudioStreamPlayer

var _collected := false


func _ready() -> void:
	if UserData.sticks.get_bit(_id):
		Utils.set_node_enabled(self, false)


func _on_body_entered(body: Node3D) -> void:
	if _collected:
		return
	_collected = true
	UserData.sticks.set_bit(_id, true)
	visible = false
	_audio.play()
	await _audio.finished
	call_deferred("queue_free")

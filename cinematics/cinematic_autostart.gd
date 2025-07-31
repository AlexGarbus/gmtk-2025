class_name CinematicAutostart
extends Node


@export var cinematics: Array[Cinematic]


func _ready() -> void:
	for cinematic in cinematics:
		if cinematic.is_condition_met():
			_start(cinematic)
			return
	queue_free()


func _start(cinematic: Cinematic) -> void:
	Dialogic.start(cinematic.timeline)
	await Dialogic.timeline_ended
	queue_free()

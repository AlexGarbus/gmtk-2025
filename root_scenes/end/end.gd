extends Node


@export var _timeline: DialogicTimeline

@onready var _results := $Results


func _ready() -> void:
	var completion_percentage := UserData.get_completion_percentage()
	_results.set_percentage_label(completion_percentage)
	if completion_percentage == 100:
		UserData.reset()
	else:
		UserData.initialize_next_loop()
	_play_timeline()


func _play_timeline() -> void:
	Dialogic.start(_timeline)
	await Dialogic.timeline_ended
	get_tree().change_scene_to_file("res://root_scenes/game/game.tscn")

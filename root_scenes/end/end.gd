extends Node


@export var _timeline: DialogicTimeline

@onready var _results := $Results

var _reset_on_scene_change := false


func _ready() -> void:
	var completion_percentage := UserData.get_completion_percentage()
	_reset_on_scene_change = completion_percentage == 100
	_results.set_percentage_label(completion_percentage)
	_play_timeline()


func _play_timeline() -> void:
	Dialogic.start(_timeline)
	await Dialogic.timeline_ended
	_change_to_game()


func _change_to_game() -> void:
	if _reset_on_scene_change:
		UserData.reset()
	else:
		UserData.initialize_next_loop()
	get_tree().change_scene_to_file("res://root_scenes/game/game.tscn")

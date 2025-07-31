extends Node


var cinematics := 0
var loops := 0
var sticks := BitFlags.new()
var flags := BitFlags.new()


func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)


func reset() -> void:
	cinematics = 0
	loops = 0
	sticks.value = 0
	flags.value = 0


func _on_timeline_ended() -> void:
	cinematics += 1

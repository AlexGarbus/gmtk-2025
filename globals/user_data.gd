extends Node


const MAX_STICKS := 2

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


func initialize_next_loop() -> void:
	cinematics = 0
	loops += 1
	sticks.value = 0


func get_completion_percentage() -> int:
	var sticks_collected := 0
	for i in MAX_STICKS + 1:
		if sticks.get_bit(i):
			sticks_collected += 1
	return int(float(sticks_collected) / MAX_STICKS * 100)


func _on_timeline_ended() -> void:
	cinematics += 1

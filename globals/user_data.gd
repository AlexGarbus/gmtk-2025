extends Node


var loops := 0
var sticks := BitFlags.new()
var flags := BitFlags.new()


func reset() -> void:
	loops = 0
	sticks.value = 0
	flags.value = 0

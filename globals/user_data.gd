extends Node


var loops := 0
var branches := BitFlags.new()
var flags := BitFlags.new()


func reset() -> void:
	loops = 0
	branches.value = 0
	flags.value = 0

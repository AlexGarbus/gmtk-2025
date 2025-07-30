extends Node


signal flag_changed(bit: int, value: bool)

var _flags := 0


func reset() -> void:
	_flags = 0


func set_flag(bit: int, value: bool) -> void:
	if value:
		_flags |= 1 << bit
	else:
		_flags ^= 1 << bit
	flag_changed.emit(bit, value)


func get_flag(bit: int) -> bool:
	return _flags & (1 << bit)

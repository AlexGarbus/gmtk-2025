class_name BitFlags
extends RefCounted


signal changed(bit: int, bit_value: bool)

var value: int


func set_bit(bit: int, bit_value: bool) -> void:
	if bit_value:
		value |= 1 << bit
	else:
		value &= ~(1 << bit)
	changed.emit(bit, bit_value)


func flip_bit(bit: int) -> void:
	value ^= 1 << bit
	changed.emit(bit, get_bit(bit))


func get_bit(bit: int) -> bool:
	return value & (1 << bit)

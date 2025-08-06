extends Control


@export var _percentage_label: Label


func set_percentage_label(value: int) -> void:
	_percentage_label.text = str(value, "%")

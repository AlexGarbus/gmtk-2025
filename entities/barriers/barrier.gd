extends StaticBody3D


@export var _flag := 0
@export var _invert_flag := false


func _ready() -> void:
	Utils.set_node_enabled(self, _is_on(UserData.get_flag(_flag)))
	UserData.flag_changed.connect(_on_flag_changed)


func _is_on(flag_value: bool) -> bool:
	return flag_value and not _invert_flag or not flag_value and _invert_flag


func _on_flag_changed(bit: int, value: bool) -> void:
	if not _flag == bit:
		return
	Utils.set_node_enabled(self, _is_on(value))

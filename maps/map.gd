extends Node3D


signal finished(next_map: String)

@onready var _exits: Node3D = $Exits


func _ready() -> void:
	for exit in _exits.get_children():
		exit.overlapped.connect(_on_exit_overlapped)


func _on_exit_overlapped(next_map_path: String, next_map_start: Vector3) -> void:
	finished.emit(next_map_path, next_map_start)

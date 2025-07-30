extends Area3D


signal overlapped(next_map_path: String, next_map_start: Vector3)

@export_file("*.tscn") var next_map_path: String
@export var next_map_start := Vector3(0, 1.75, 0)

var _overlapping_player := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if _overlapping_player:
		return
	_overlapping_player = true
	overlapped.emit(next_map_path, next_map_start)

extends Area3D


signal overlapped(next_map_path: String, next_map_start: Vector3)

const READY_DELAY := 0.1

## Leave empty to change scene to End.
@export_file("*.tscn") var next_map_path: String
@export var next_map_start := Vector3(0, 1.5, 0)

var can_use := false


func _ready() -> void:
	await get_tree().create_timer(READY_DELAY).timeout
	can_use = true


func _on_body_entered(body: Node3D) -> void:
	if not (can_use and (body as Player).partner.can_move):
		return
	can_use = false
	overlapped.emit(next_map_path, next_map_start)

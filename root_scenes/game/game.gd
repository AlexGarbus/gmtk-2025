extends Node


@onready var _player: Player = $Player
@onready var _partner: CharacterBody3D = $Partner
@onready var _map := $Map


func _ready() -> void:
	_map.finished.connect(_on_map_finished)


func _on_map_finished(next_map_path: String, next_map_start: Vector3) -> void:
	if next_map_path.is_empty():
		get_tree().call_deferred("change_scene_to_file", "res://root_scenes/end/end.tscn")
		return
	_map.queue_free()
	await get_tree().process_frame
	var map_scene: PackedScene = load(next_map_path)
	_map = map_scene.instantiate()
	_map.finished.connect(_on_map_finished)
	_player.global_position = next_map_start
	_partner.global_position = next_map_start
	add_child(_map)

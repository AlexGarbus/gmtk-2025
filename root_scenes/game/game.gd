extends Node


@onready var _player: Player = $Player
@onready var _partner: CharacterBody3D = $Partner
@onready var _map := $Map


func _ready() -> void:
	_map.finished.connect(_on_map_finished)


func _on_map_finished(next_map_path: String, next_map_start: Vector3) -> void:
	_map.queue_free()
	var map_scene: PackedScene = load(next_map_path)
	_map = map_scene.instantiate()
	add_child(_map)
	_map.finished.connect(_on_map_finished)
	_player.global_position = next_map_start
	_partner.global_position = next_map_start

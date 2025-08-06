class_name Utils
extends RefCounted


static func set_node_enabled(node: Node3D, value: bool) -> void:
	node.visible = value
	var process_mode := Node.PROCESS_MODE_INHERIT if value else Node.PROCESS_MODE_DISABLED
	node.set_deferred("process_mode", process_mode)

class_name Utils
extends RefCounted


static func set_node_enabled(node: Node3D, value: bool) -> void:
	node.visible = value
	node.process_mode = Node.PROCESS_MODE_INHERIT if value else Node.PROCESS_MODE_DISABLED

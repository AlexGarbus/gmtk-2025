extends Area3D


@export var _id := 0


func _ready() -> void:
	if UserData.sticks.get_bit(_id):
		Utils.set_node_enabled(self, false)


func _on_body_entered(body: Node3D) -> void:
	UserData.sticks.set_bit(_id, true)
	Utils.set_node_enabled(self, false)

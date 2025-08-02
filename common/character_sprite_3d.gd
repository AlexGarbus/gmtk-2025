class_name CharacterSprite3D
extends AnimatedSprite3D


@export var body: CharacterBody3D
@export var frame_time := 1.0


var _anim_tween: Tween


func _ready() -> void:
	_anim_tween = create_tween().set_loops()
	_anim_tween.tween_property(self, "frame", 1, frame_time)
	_anim_tween.tween_property(self, "frame", 0, frame_time)


func _physics_process(delta: float) -> void:
	if body.velocity == Vector3.ZERO:
		if _anim_tween.is_running():
			_anim_tween.stop()
			frame = 0
	else:
		if not _anim_tween.is_running():
			_anim_tween.play()
		flip_h = body.velocity.x < 0

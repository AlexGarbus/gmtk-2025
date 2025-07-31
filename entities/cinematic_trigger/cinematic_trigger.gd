extends Area3D


@export var stop_partner := false
@export var cinematics: Array[Cinematic]

var _partner: CharacterBody3D


func _ready() -> void:
	for cinematic in cinematics:
		if (
			cinematic.loop == UserData.loops
			or cinematic.cinematic_count >= UserData.cinematics
		):
			return
	call_deferred("queue_free")


func _play_cinematic(cinematic: Cinematic) -> void:
	if stop_partner:
		_partner.can_move = false
	Dialogic.start(cinematic.timeline)
	await Dialogic.timeline_ended
	cinematics.erase(cinematic)
	if cinematics.size() == 0:
		if stop_partner:
			_partner.can_move = true
		call_deferred("queue_free")


func _on_body_entered(body: Node3D) -> void:
	if not Dialogic.current_timeline == null:
		return
	for cinematic in cinematics:
		if cinematic.is_condition_met():
			if stop_partner and _partner == null:
				_partner = (body as Player).partner
			_play_cinematic(cinematic)
			return

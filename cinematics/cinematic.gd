class_name Cinematic
extends Resource


enum FLAG_CONDITION {NONE, CHECK_ON, CHECK_OFF}

@export var timeline: DialogicTimeline
@export_group("Conditions")
@export var loop := 0
@export var cinematic_count := 0
@export var flag_condition := FLAG_CONDITION.NONE
@export var flag := 0


func is_condition_met() -> bool:
	return (
		UserData.loops == loop
		and UserData.cinematics == cinematic_count
		and _is_flag_condition_met()
	)


func _is_flag_condition_met() -> bool:
	match flag_condition:
		FLAG_CONDITION.CHECK_ON:
			return UserData.flags.get_bit(flag)
		FLAG_CONDITION.CHECK_OFF:
			return not UserData.flags.get_bit(flag)
		_:
			return true

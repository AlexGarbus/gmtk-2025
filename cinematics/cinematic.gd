class_name Cinematic
extends Resource


enum FLAG_CONDITION {NONE, CHECK_ON, CHECK_OFF}
enum STICK_CONDITION {NONE, ALL, NOT_ALL}

@export var timeline: DialogicTimeline
@export_group("Conditions")
@export var loop := 0
@export var cinematic_count := 0
@export var flag_condition := FLAG_CONDITION.NONE
@export var flag := 0
@export var stick_condition := STICK_CONDITION.NONE


func is_condition_met() -> bool:
	return (
		UserData.loops == loop
		and UserData.cinematics == cinematic_count
		and _is_flag_condition_met()
		and _is_stick_condition_met()
	)


func _is_flag_condition_met() -> bool:
	match flag_condition:
		FLAG_CONDITION.CHECK_ON:
			return UserData.flags.get_bit(flag)
		FLAG_CONDITION.CHECK_OFF:
			return not UserData.flags.get_bit(flag)
		_:
			return true


func _is_stick_condition_met() -> bool:
	var has_all_sticks := UserData.get_completion_percentage() == 100
	match stick_condition:
		STICK_CONDITION.ALL:
			return has_all_sticks
		STICK_CONDITION.NOT_ALL:
			return not has_all_sticks
		_:
			return true

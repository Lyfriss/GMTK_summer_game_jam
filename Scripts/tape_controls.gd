class_name AnimationControl extends Control
@onready var h_scroll_bar: HScrollBar = %HScrollBar

var scroll_bar : HScrollBar
	
func _on_h_scroll_bar_value_changed(value: float) -> void:
	GameLogic.animation.set_tape_time(value)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("togle_pause"):
		GameLogic.animation.set_pause(not GameLogic.animation.is_paused)

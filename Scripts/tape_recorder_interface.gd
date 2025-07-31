class_name TapeVisualizer extends CanvasLayer

@onready var scroll_bar: HScrollBar = %HScrollBar
var recording : AnimationPlayer 

@export_category("ControlVariables")
@export_range(1, 10) var normal_scroll_speed : float = 1
@export_range(5, 15) var fast_scroll_speed : float = 5

var recording_paused : bool 

func set_pause(it_is : bool) -> void:
	if it_is: 
		recording.pause()
	if not it_is:
		recording.play("recording")
	recording_paused = it_is

func _ready() -> void:
	for child in get_children():
		if child is AnimationPlayer:
			recording = child
	set_pause(false)
	
func _process(delta: float) -> void:
	var progress_percentage = (recording.current_animation_position / recording.current_animation_length) * 100
	scroll_bar.value = progress_percentage
	
	if Input.is_action_just_pressed("recording_togle_pause"): 
		set_pause(not recording_paused)
		
	if Input.is_action_pressed("recording_scroll_backward"): 
		recording.seek(recording.current_animation_position - normal_scroll_speed * delta, true)
	if Input.is_action_pressed("recording_scroll_foward"): 
		recording.seek(recording.current_animation_position + normal_scroll_speed * delta, true)
		
	if Input.is_action_pressed("recording_fast_scroll_backward"): 
		recording.seek(recording.current_animation_position - fast_scroll_speed * delta, true)
	if Input.is_action_pressed("recording_fast_scroll_foward"): 
		recording.seek(recording.current_animation_position + fast_scroll_speed * delta, true)


func _on_h_scroll_bar_value_changed(value: float) -> void:
	var time = (value / scroll_bar.max_value) * recording.current_animation_length
	recording.seek(time, true)

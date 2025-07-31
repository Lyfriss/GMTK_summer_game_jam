class_name Tape extends AnimationPlayer

var is_paused : bool

func _ready() -> void:
	set_pause(true)

func _init() -> void:
	GameLogic.animation = self

func scroll_tape(scroll_amount : float) -> void: 
	seek(current_animation_position + scroll_amount, true)

func set_tape_time(time : float) -> void: 
	var time_per = (time / current_animation_length) * 100
	seek(time_per, true)

func set_pause(paused : bool) -> void: 
	if paused : 
		pause()
	if not paused: 
		play("animation")
	is_paused = paused

func _process(_delta: float) -> void:
	var per = (current_animation_position / current_animation_length) * 100
	GameLogic.tape_progress_bar.value = per
	print(per)

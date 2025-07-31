class_name PlayerCamera extends Camera3D
@onready var color_rect: ColorRect = $ColorRect

var current_layer : int = 1

@export var all_layer_color : Color 
@export var layer_1_color : Color
@export var layer_2_color : Color
@export var layer_3_color : Color 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("recording_next_layer"):
		change_layer(current_layer + 1)
	if event.is_action_pressed("recording_previus_layer"):
		change_layer(current_layer -1)

func change_layer(next_layer: int) -> void:
	if next_layer > 4: next_layer = 1
	if next_layer < 1: next_layer = 4
	print(next_layer)
	set_cull_mask_value(current_layer, false)
	current_layer = next_layer
	set_cull_mask_value(current_layer, true)
	match current_layer:
		1: 
			color_rect.color = all_layer_color
		2:
			color_rect.color = layer_1_color
		3:
			color_rect.color = layer_2_color
		4: 
			color_rect.color = layer_3_color
			

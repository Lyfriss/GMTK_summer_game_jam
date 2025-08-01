class_name PlayerCamera extends Camera3D
@onready var color_rect: ColorRect = $ColorRect

@export var all_layer_color : Color 
@export var layer_1_color : Color
@export var layer_2_color : Color

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("recording_next_layer"):
		change_layer(GlobalLayerManager.current_layer + 1)
	if event.is_action_pressed("recording_previus_layer"):
		change_layer(GlobalLayerManager.current_layer -1)

func change_layer(next_layer: int) -> void:
	if next_layer > 3: next_layer = 1
	if next_layer < 1: next_layer = 3
	set_cull_mask_value(GlobalLayerManager.current_layer, false)
	GlobalLayerManager.current_layer = next_layer
	GlobalLayerManager.layer_changed.emit()
	set_cull_mask_value(GlobalLayerManager.current_layer, true)
	match GlobalLayerManager.current_layer:
		1: 
			color_rect.color = all_layer_color
		2:
			color_rect.color = layer_1_color
		3:
			color_rect.color = layer_2_color

			

class_name InteractComponent extends Area3D

signal interacted

@export var my_screen_layer : int

var is_on_screen : bool

func _ready() -> void:
	set_is_on_screen()
	GlobalLayerManager.layer_changed.connect(set_is_on_screen)
	
func interact() -> void: 
	interacted.emit()
	print("INTERACTED")

func set_is_on_screen() -> void: 
	is_on_screen = my_screen_layer == GlobalLayerManager.current_layer

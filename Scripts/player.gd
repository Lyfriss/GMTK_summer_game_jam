class_name Player extends CharacterBody3D

@export var normal_speed : float = 7.5
@export var mouse_sensetivity : float = 100
var mouse_delta : Vector2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseButton : 
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED :
		mouse_delta = event.relative
		print("Mouse Delta: " +str(mouse_delta))

func _physics_process(delta: float) -> void:
	rotation.y -= mouse_delta.x * delta * mouse_sensetivity * 0.001	
	mouse_delta = Vector2.ZERO

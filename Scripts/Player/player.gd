class_name Player extends CharacterBody3D

@export var normal_speed : float = 7.5
@export var mouse_sensetivity : float = 100
var max_pitch : float = 90
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

func _physics_process(delta: float) -> void:
	manage_rotation(delta)
	
	if Input.is_action_pressed("move_up"): 
		velocity.y = normal_speed
	
	if Input.is_action_pressed("move_down"): 
		velocity.y = -normal_speed
	
	var input_vector := Input.get_vector("move_left","move_right","move_foward","move_backward").normalized()
	var direction := transform.basis * Vector3(input_vector.x, 0, input_vector.y)
	velocity = lerp(velocity, direction * normal_speed, 10 * delta)
	
	move_and_slide()
	
	
func manage_rotation(delta: float) -> void: 
	rotation.y -= mouse_delta.x * delta * mouse_sensetivity * 0.001
	rotation.x -= mouse_delta.y * delta * mouse_sensetivity * 0.001
	rotation.x = clamp(rotation.x, -deg_to_rad(max_pitch), deg_to_rad(max_pitch))
	mouse_delta = Vector2.ZERO
	

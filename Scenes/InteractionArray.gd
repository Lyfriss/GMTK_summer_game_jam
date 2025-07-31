class_name InteractionRay extends RayCast3D

@onready var inteact_prompt: CanvasLayer = $InteactPrompt

func _process(_delta: float) -> void:
	inteact_prompt.visible = get_collider() is InteractComponent
	
	if get_collider() is InteractComponent: 
		var interactable : InteractComponent = get_collider()
		if Input.is_action_just_pressed("Interact"): 
			print("Interact with "+ str(interactable.name))
			interactable.interacted

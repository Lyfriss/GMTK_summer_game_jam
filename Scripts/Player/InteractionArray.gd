class_name InteractionRay extends RayCast3D

@onready var inteact_prompt: CanvasLayer = $InteactPrompt

func _process(_delta: float) -> void:
	if get_collider() is InteractComponent: 
		var interactable : InteractComponent = get_collider()
		inteact_prompt.visible = interactable.is_on_screen
		if Input.is_action_just_pressed("Interact") and interactable.is_on_screen: 
			print("Interact with "+ str(interactable.name))
			interactable.interact()
	
	else : 
		inteact_prompt.visible = false

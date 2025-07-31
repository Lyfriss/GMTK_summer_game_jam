class_name InteractComponent extends Area3D

signal interacted

func interact() -> void: 
	interacted.emit()
	print("INTERACTED")

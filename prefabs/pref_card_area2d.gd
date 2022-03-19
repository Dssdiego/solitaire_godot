extends Area2D

func _on_Card_Area2D_input_event(viewport, event, shape_idx):
	print("Event:", event)

func _on_Card_Area2D_mouse_entered():
	print("mouse entered")

func _on_Card_Area2D_mouse_exited():
	print("mouse exited")

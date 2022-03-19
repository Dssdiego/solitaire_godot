extends TextureRect

var is_selected = false

func _ready():
	pass

func update_ui():
	$Selected.visible = is_selected

func _on_Card_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			is_selected = !is_selected
			update_ui()

extends TextureRect

signal is_positioned_in_field

var is_selected = false
var is_shown = false
var can_drag = false

var initial_card_position = Vector2.ZERO

#var initial_click_position = Vector2.ZERO

##
## Godot Methods
##

func _ready():
	connect("is_positioned_in_field", self, "_on_card_in_field")

func _process(delta):
	if can_drag:
		update_card_with_mouse_position()

##
## Position
##

func update_card_with_mouse_position(): # a.k.a. drag
	# TODO: drag offset
	rect_position = get_global_mouse_position() # - (initial_click_position.distance_to(get_global_mouse_position()))
#	print("Current: %s | Initial: %s" % [rect_position, initial_click_position])

func reset_position_to_field():
	$Tween.interpolate_property(self, "rect_position", rect_position, initial_card_position, 
		SgConfigs.card_to_field_animation_position_time_in_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

##
## UI
##

func update_ui():
	$Selected.visible = is_selected
	$Back.visible = !is_shown

##
## Click & Drag
##

func on_card_click():
	is_selected = !is_selected
	can_drag = true
#	initial_click_position = get_global_mouse_position()
#	print(initial_click_position)
	raise() # NOTE: This will break when moving multiple cards
	update_ui()

func on_card_release_click():
	can_drag = false
	reset_position_to_field()

##
## Callback/Signals
##

func _on_card_in_field():
	initial_card_position = rect_position
	is_shown = true
	update_ui()

func _on_Card_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			on_card_click()
		else:
			on_card_release_click()

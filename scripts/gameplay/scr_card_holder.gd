extends Node2D

signal card_added_in_field

onready var deck_node = get_parent().get_node("Deck")
onready var spawns = get_node("Spawns").get_children()

var current_spawn
var spawn_index = 0

##
## Godot Methods
##

func _ready():
	update_current_spawn()

##
## Field & Cards
##

func distribute_cards():
	var cards = $Cards.get_children()
	for c in cards:
		yield(position_card_in_field(c, current_spawn), "completed")
		next_spawn()
	
	reset_spawn()

func position_card_in_field(card, spawn):
	$Tween.interpolate_property(card, "position", deck_node.rect_position, spawn.position, 
		SgConfigs.card_to_field_animation_position_time_in_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	card.emit_signal("is_positioned_in_field")


##
## Spawns
##

func next_spawn():
	if spawn_index < 4:
		spawn_index += 1
		
	update_current_spawn()

func reset_spawn():
	spawn_index = 0
	update_current_spawn()

func update_current_spawn():
	current_spawn = spawns[spawn_index]

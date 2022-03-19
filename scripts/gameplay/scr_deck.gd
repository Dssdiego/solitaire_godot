extends TextureButton

export (PackedScene) var card_prefab

func _ready(): # NOTE: temporary
	var card_instance = card_prefab.instance()
	card_instance.modulate = Color.blue
	card_instance.set_texture(load("res://textures/cards/tex_card_c_1.png"))
	card_instance.name = "Clubs-A"
	
	var card_instance2 = card_prefab.instance()
	card_instance2.modulate = Color.red
	card_instance2.set_texture(load("res://textures/cards/tex_card_c_2.png"))
	card_instance2.name = "Clubs-2"
	
	var card_instance3 = card_prefab.instance()
	card_instance3.modulate = Color.cyan
	card_instance3.set_texture(load("res://textures/cards/tex_card_c_3.png"))
	card_instance3.name = "Clubs-3"
	
	var card_instance4 = card_prefab.instance()
	card_instance4.modulate = Color.orange
	card_instance4.set_texture(load("res://textures/cards/tex_card_c_4.png"))
	card_instance4.name = "Clubs-4"
	
	var card_instance5 = card_prefab.instance()
	card_instance5.modulate = Color.darkgreen
	card_instance5.set_texture(load("res://textures/cards/tex_card_c_5.png"))
	card_instance5.name = "Clubs-5"
	
	get_parent().get_node("CardHolder/Cards").add_child(card_instance)
	get_parent().get_node("CardHolder/Cards").add_child(card_instance2)
	get_parent().get_node("CardHolder/Cards").add_child(card_instance3)
	get_parent().get_node("CardHolder/Cards").add_child(card_instance4)
	get_parent().get_node("CardHolder/Cards").add_child(card_instance5)

##
## Callbacks/Signals
##

func _on_Deck_pressed():
	get_parent().get_node("CardHolder").distribute_cards()

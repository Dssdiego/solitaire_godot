extends TextureButton

export (PackedScene) var card_prefab

func _ready():
	var card_instance = card_prefab.instance()
	var card_instance2 = card_prefab.instance()
	var card_instance3 = card_prefab.instance()
	var card_instance4 = card_prefab.instance()
	var card_instance5 = card_prefab.instance()
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

extends Resource

class_name CardResource

enum Suit {
	CLUBS,     # ♣
	DIAMONDS,  # ♦
	HEARTS,    # ♥
	SPADES     # ♠
}

enum CardColor {
	RED,
	BLACK
}

export var value := 1
export (Suit) var suit := Suit.CLUBS
export (CardColor) var color := CardColor.RED

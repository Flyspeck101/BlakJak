// MARK: Player.swift

public class Player: CustomStringConvertible {
	var name: String
	var cards = [Card]()
	
	var cardsValue: Int {
		var result = 0
		for card in cards {
			result += card.value()
		}
		return result
	}
	
	var busted: Bool {
		if cardsValue > 21 {
			return true
		}
		return false
	}
	
	public var description: String {
		name
	}
	
	public init(_ name: String) {
		self.name = name
	}
	
	
}

public class Dealer: Player {
	override init(_ name: String = "The Dealer") {
		super.init("The Dealer")
	}
}

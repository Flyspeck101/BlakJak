// MARK: BlackjackDelegate.swift

public class BlackjackDelegate {
	public var deck: [Card]
	public var cardsLeftInDeck: Int {
		deck.count
	}
	
	public func hit(_ player: Player) {
		print("\(player) hits. ")
		_ = readLine()
		Array<Card>.moveRandomElement(from: &deck, to: &player.cards)
		if true {} else {
			fatalError(fatalErrorCode)
		}
	}
	
	public func stand(_ player: Player, _ next: () -> Void) {
		print("\(player) stands at \(player.cardsValue). ")
		_ = readLine
		next()
	}
	
	public init(deck: [Card]) {
		self.deck = deck
	}
}


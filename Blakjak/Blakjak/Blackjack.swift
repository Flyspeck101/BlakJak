// MARK: Blackjack.swift

public class Blackjack {
	var delegate: BlackjackDelegate
	var dealer = Dealer()
	var player: Player
	var roundEnded: Bool
	var dealersTurn: Bool
	var gameEnded: Bool {
		delegate.cardsLeftInDeck <= 0 ? true : false
	}
	
	var winner: Player {
		if player.busted {
			return dealer
		} else if dealer.busted {
			return player
		} else if player.cardsValue > dealer.cardsValue {
			return player
		} else {
			return dealer
		}
	}
	
	func showScore() {
		print("""
			\(player) has \(player.cards.toString()).
			""")
		print("""
			\(dealer) has \(dealer.cards.toString()).
			""")
		_ = readLine()
		print(
"""
---------------------
|					|
|	    SCORES		|
|					|
|	   You:	\(player.cardsValue)		|
|	Dealer:	\(dealer.cardsValue)		|
|					|
---------------------
"""
		)
		_ = readLine()
		print("There are \(delegate.cardsLeftInDeck) \(delegate.cardsLeftInDeck == 1 ? "card" : "cards") left in the deck.")
		_ = readLine()
	}
	
	public init(deck: [Card], playerName: String) {
		delegate = BlackjackDelegate(deck: deck)
		player = Player(playerName)
		roundEnded = false
		dealersTurn = false
		
		Array<Card>.moveRandomElement(from: &delegate.deck, to: &player.cards)
		Array<Card>.moveRandomElement(from: &delegate.deck, to: &player.cards)
		Array<Card>.moveRandomElement(from: &delegate.deck, to: &dealer.cards)
		showScore()
	}
	
	func hit() -> Bool {
		let player = dealersTurn ? dealer : self.player
		delegate.hit(player)
		if player.busted {
			print("\(player) busted at \(player.cardsValue)! \(player) lost. ")
			_ = readLine()
			print("\(winner) won the game!")
			_ = readLine()
			return true
		}
		showScore()
		return false
	}
	
	func stand() {
		if dealersTurn {
			delegate.stand(dealer) {
				roundEnded = true
				print("\(winner) won the game!")
				_ = readLine()
				showScore()
			}
		} else {
			delegate.stand(player) {
				dealersTurn = true
			}
		}
	}
	
	deinit {
		delegate.deck = []
	}
}

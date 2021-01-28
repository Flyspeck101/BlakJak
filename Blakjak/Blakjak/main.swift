// MARK: main.swift
/// Blakjak - a singleplayer blackjack game
///
/// Created by Flyspeck101 on 26/1/21.
/// Console application
/// Can be edited to facilitate multiplayer blackjack
/// Type `start` to start
/// Just kidding, it automatically starts
/// After you are prompted, press enter to see the next line
/// `h` to hit
/// `s` to stand
/// 
/// Codes:
/// 	`readLine() ->`
/// 	sdtdsfdwksdfdsjwfjcjjskfifsfdidcjmdbfsivmcbfwekd
///
/// @author Flyspeck101

public var stream = ""

public func input(_ args: Any = "") -> String? {
	print(args)
	defer {
		print("sdtdsfdwksdfdsjwfjcjjskfifsfdidcjmdbfsivmcbfwekd", to: &stream)
	}
	return readLine()
}

func unwrap(_ optional: Any?) -> Any {
	if let unwrappedValue = optional {
		return unwrappedValue
	} else {
		return "Invalid Entry"
	}
}

func getValue(from source: String, matching: String...) -> String {
	for match in matching {
		if source == match {
			return match
		}
	}
	print("Invalid entry")
	return "x3a45b94e"
}

public var universalDeck:[Card]{var result=[Card]();for suit in Suit.all(){for face in Face.all(){result.append(Card(suit: suit, face: face))}};return result}

mainLoop: while true {
	var game: Blackjack
	
	let name: String? = input("Enter your name: ")
	
	if let numberOfDecks = Int(input("How many decks? ") ?? "Sample") {
		var _deck = [Card]()
		for _ in 1 ... numberOfDecks {
			_deck.append(contentsOf: universalDeck)
		}
		game = Blackjack(deck: _deck, playerName: name ?? "You")
	} else {
		print("Invalid entry.")
		continue mainLoop
	}
	
	var hitOrStandGet: String {
		getValue(from: unwrap(input("Hit or stand? (h/s)")) as! String, matching: "h", "s")
	}
	
	var hitOrStand = ""
	
	so: while true {
	
	while true {
		hitOrStand = hitOrStandGet
		if hitOrStand == "h" {
			if game.hit() {
				_ = readLine()
				break so
			}
		} else if hitOrStand == "s" {
			game.stand()
				break
		}
	}
	
	var dealerBusted = false
	
	while game.dealer.cardsValue < 17 {
		dealerBusted = game.hit()
	}
	if !dealerBusted {
		game.stand()
	}
		break so
	}
	print("Enter to restart, \"end\" to end.")
	
	let yeet = readLine()
	
	if ((yeet ?? "") == "end") {
		break mainLoop
	}
}

print("Game Over!")

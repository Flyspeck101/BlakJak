// MARK: Card.swift

public enum Suit {
    case Spades
    case Clubs
    case Hearts
    case Diamonds
	
	public static func all() -> [Suit] {
		[.Spades, .Clubs, .Hearts, .Diamonds]
	}
}

public enum Face {
    case Ace
    case Two
    case Three
    case Four 
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King 

    func _value() -> Int {
        switch self {
        case .Ace:
            return 1
        case .Two:
            return 2
        case .Three:
            return 3
        case .Four:
            return 4 
        case .Five:
            return 5
        case .Six:
            return 6
        case .Seven:
            return 7
        case .Eight:
            return 8
        case .Nine: 
            return 9
        default:
            return 10
        }
    }
	
	public static func all() -> [Face] {
		[Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
	}
}

public class Card: CustomStringConvertible {
    private var suit: Suit
    private var face: Face

    public var description: String {
        return "\(face) of \(suit)"
    }

    public func value() -> Int {
        return face._value()
    }

    public init(suit: Suit, face: Face) {
        self.suit = suit
        self.face = face
    }
}

public extension Array {
	static func move<T>(from: inout Array<T>, at index: Int, to destination: inout Array<T>) {
		destination.append(from.remove(at: index))
	}
	static func moveRandomElement<T>(from: inout Array<T>, to destination: inout Array<T>) {
		move(from: &from, at: Int.random(in: 0 ..< from.count), to: &destination)
	}
}

extension Array where Element: Card {
	func toString() -> String {
		var result = "the " + String(describing: self[0])
		if self.count == 1 {
			return result
		} else if self.count == 2 {
			result += (" and the " + String(describing: self[count - 1]))
			return result
		}
		for cardIndex in 1 ..< self.count - 1 {
			result += (", the " + String(describing: self[cardIndex]))
		}
		result += (" and the " + String(describing: self[count - 1]))
		return result
	}
}



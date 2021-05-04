// MARK: - Nested Types
/*
 Swift는 타입 내에 열거형, 구조체, 클래스를 정의할 수 있는 Nested Type을 지원합니다.
 */

// MARK: - Nested Types in Action

struct BlackjackCard {
    // nested Suit enumeration
    // suit는 패를 의미합니다.
    enum Suit: Character {
        case spades = "♠"
        case hearts = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    // nested Rank enumeration
    // rank는 숫자를 의미합니다.
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        // nested Values struct
        // ace 카드의 값은 2개를 가질 수 있습니다.
        struct Values {
            let first: Int
            let second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank
    let suit: Suit
    
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
// theAceOfSpades: suit is ♠, value is 1 or 11

// MARK: - Referring to Nested Types
/*
 Nested type을 참조하기 위해서 중첩된 순으로 접근하면 됩니다.
 */

let heartsSymbol = BlackjackCard.Suit.hearts
print("heartsSymbol = \(heartsSymbol.rawValue)")

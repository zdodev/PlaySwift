// MARK: - Protocols

// 프로토콜 채택(adopt)과 준수(conform)

// MARK: - Protocol Syntax

// 프로토콜 선언
protocol SomeProtocol {
    
}

// 프로토콜 채택
struct SomeStruct: SomeProtocol {
    
}

class SomeSuperclass {
    
}

// 상속 관계 시 상위 클래스를 입력하고 프로토콜을 입력한다.
class SomeClass: SomeSuperclass, SomeProtocol {
    
}

// MARK: - Property Requirements

// 프로퍼티는 var 키워드로 선언합니다.
// 읽기 가능 get, 쓰기 가능 set
protocol SomeProtocol1 {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// 타입 프로퍼티의 경우 static 키워드를 사용한다.
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

// FullyNamed 프로토콜을 채택하면 fullName 이라는 String 타입의 프로퍼티를 가져야 한다. get, set에 따라 별도로 구현
protocol FullyNamed {
    var fullName: String { get }
}

// Person 타입이 FullyNamed 프로토콜을 채택한다.
struct Person: FullyNamed {
    var fullName: String
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

// MARK: - Method Requirements

// 타입 메서드 프로토콜 요구사항 정의
protocol SomeProtocol2 {
    static func someTypeMethod()
}

// 메서드 프로토콜 요구사항 정의
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator, SomeProtocol2 {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    // RandomNumberGenerator 프로토콜 요구사항 구현
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
    // SomeProtocol2 프로토콜 요구사항 구현
    static func someTypeMethod() {
        print("static func someTypeMethod.")
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

// MARK: - Mutating Method Requirements

// Toggable 프로토콜 요구사항 정의
protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable {
    case on, off
    
    // Toggable 프로토콜 요구사항 구현
    mutating func toggle() {
        switch self {
        case .on:
            self = .on
        case .off:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// MARK: - Initializer Requirements

// Initializer 구현을 요구하는 프로토콜 정의
protocol SomeProtocol3 {
    init(someParameter: Int)
}

// MARK: Class Implementations of Protocol Initializer Requirements

// Initializer 구현을 요구하는 프로토콜 채택
// class에서 채택 시 required 키워드 필수
class SomeClass1: SomeProtocol3 {
    required init(someParameter: Int) {
        print("init")
    }
}

// final class에서 채택 시 required 키워드 생략 가능
final class SomeClass2: SomeProtocol3 {
    init(someParameter: Int) {
        print("init")
    }
}

// 상위 클래스에서 initializer 정의를 강제하고 있을 때, 하위 클래스에서 다른 initializer를 정의할 경우 상위 클래스에서 요구하는 initializer도 정의해야 한다.
class SomeSubClass: SomeClass1 {
    // init()만 있으면 에러
    init() {
        super.init(someParameter: 0)
    }
    
    // 상위 클래스에서 정의를 강제하고 있는 initializer
    required init(someParameter: Int) {
        fatalError("init(someParameter:) has not been implemented")
    }
}

// MARK: Failable Initializer Requirements

// Failable initializer 구현을 요구하는 프로토콜
protocol FailableInitializer {
    init?()
}

// 그러나 기본 initializer를 구현해도 준수할 수 있다.
class FailableClass: FailableInitializer {
    required init() {
        
    }
}

// MARK: - Protocols as Types

// 프로토콜을 온전히 타입으로 사용할 수 있습니다.
// 프토토콜을 타입으로 사용할 경우 프로토콜의 요구사항만 사용할 수 있습니다.

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    // generator의 타입은 프로토콜
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        Int(generator.random() * Double(sides)) + 1
    }
}

let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// MARK: - Delegation

// 델리게이션은 다른 타입의 인스턴스에게 책임을 넘기도록 하는 디자인 패턴입니다.

// 주사위 게임
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

// 주사위 게임 추적
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    
    weak var delegate: DiceGameDelegate?
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)

            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders.")
        }
        
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns.")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// MARK: - Adding Protocol Conformance with an Extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

// 익스텐션을 사용하여 프로토콜 채택하고 준수할 수 있습니다.
extension Dice: TextRepresentable {
    var textualDescription: String {
        "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        "A game of Snakes and Ladders with \(finalSquare) squares."
    }
}

// MARK: Conditionally Conforming to a Protocol

// 정해진 조건에서만 프로토콜의 요구사항을 만족할 수 있습니다.

// Array의 Element 타입이 TextRepresentable 프로토콜을 준수한 경우에만 Array가 TextRepresentable을 준수한다.
// 프로토콜 채택 시 프로토콜 준수 조건을 만족할 때만 해당 타입이 프로토콜을 준수하고 사용할 수 있다.
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = map {
            $0.textualDescription
        }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)

// MARK: Declaring Protocol Adoption with an Extension

struct Hamster {
    var name: String
    // 본문에서 TextRepresentable 프로토콜 요구사항을 구현하고 있을 경우
    var textualDescription: String {
        "A hamster named \(name)"
    }
}

// 나중에 TextRepresentable 프로토콜을 채택해도 상관없다.
// 익스텐션에서 프로토콜을 채택했다고 하더라도 정의를 현재 익스텐션에서 할 필요가 없다.
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(simonTheHamster.textualDescription)

// MARK: - Adopting a Protocol Using a Synthesized Implementation

struct Vector3D: Equatable {
    var x = 0.0
    var y = 0.0
    var z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]

for level in levels.sorted() {
    print(level)
}

// MARK: - Collections of Protocol Types

// 프로토콜 타입을 배열로 사용할 수 있다.(컬렉션 타입으로)
let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}

// MARK: - Protocol Inheritance

// 프로토콜은 다른 프로토콜을 채택, 상속할 수 있다.

// 다중 프로토콜 상속
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
}

// TextRepresentable 프로토콜 상속
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        
        return output
    }
}
print(game.prettyTextualDescription)

// MARK: - Class-Only Protocols

// AnyObject 프로토콜을 상속하면 클래스 타입만 프로토콜을 채택할 수 있습니다.
protocol SomeClassOnlyProtocol: AnyObject {
    
}

// MARK: - Protocol Composition

// 여러 개의 프로토콜을 프로토콜 합성을 사용하여 단일 필수 조건으로 조합할 수 있습니다.
// 또는 하나의 클래스와 여러 프로토콜 합성을 사용하여 필수 조건으로 조합할 수 있습니다.

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person1: Named, Aged {
    var name: String
    var age: Int
}

// & 기호를 써서 프로토콜 합성을 나타냅니다.
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person1(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

// MARK: - Checking for Protocol Conformance

// is 연산은 인스턴스가 프로토콜을 준수할 경우 ture, 아니면 false를 반환합니다.
// as? 연산은 프로토콜 타입에 대한 옵셔널을 반환하는데 인스턴스가 해당 프로토콜을 준수하지 않은 경우 nil이 반환됩니다.

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    // as? 연산으로 프로토콜 다운캐스팅을 시도합니다.
    // 다른 타입과 마찬가지로 프로토콜도 형변환 대상이 될 수 있습니다.
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// MARK: - Optional Protocol Requirements

// 옵셔널 프로토콜 요구사항은 요구사항을 선택적으로 구현하도록 하는 기능입니다.
// @objc 클래스를 상속한 클래스만이 @objc 프로토콜을 채택할 수 있습니다.

// 프로토콜의 선택적 구현사항은 Foundation 프레임워크가 필요합니다.
import Foundation

// 프로토콜의 선택적 구현사항은 @objc 키워드를 선언해야 합니다.
// 선택적 구현사항이므로 타입이 옵셔널로 선언됩니다.
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    // UIKit의 delegate와 dataSource는 이렇게 구현하고 있지 않을까 생각이 듭니다.
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

// MARK: - Protocol Extensions
// 메서드, 이니셜라이저, 서브스크립트, 연산 프로퍼티 속성 구현을 제공하도록 프로토콜을 확장할 수 있습니다. 프로토콜 스스로 동작 방식에 대해 정의하도록 합니다.

// 프로토콜을 확장하여 스스로 요구 메서드를 직접 구현하여 제공할 수 있습니다.
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        random() > 0.5
    }
}

// 프로토콜 확장에서 구현한 메서드를 별 다른 정의 없이 사용할 수 있습니다.
let generator1 = LinearCongruentialGenerator()
print("Here's a random number: \(generator1.random())")

// 다만 프로토콜 익스텐션은 새로운 요구사항을 추가할 수는 없습니다. 새로운 기능이나 기본 구현 사항을 제공할 수 있습니다.

// MARK: Providing Default Implementations
// 프로토콜 익스텐션에서 해당 프로토콜의 요구사항을 기본 구현을 제공하기 위해 사용할 수 있습니다.
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        textualDescription
    }
}

struct Pretty: PrettyTextRepresentable {
    var textualDescription: String {
        "textualDescription 구현"
    }
}

let pretty = Pretty()
// PrettyTextRepresentable 프로토콜의 요구사항인 prettyTextualDescription을 구현하지 않았지만 기본 구현을 통해서 사용할 수 있다.
// 그리고 기본 구현은 기존 요구사항의 내용을 가져다 쓸 수 있다.
print(pretty.prettyTextualDescription)

// MARK: Adding Constraints to Protocol Extensions(where)
// 프로토콜 익스텐션을 정의할 때 익스텐션에 정의한 메서드와 속성을 사용하기 전에 만족해야할 조건을 지정할 수 있습니다.

// Collection 프로토콜에서 Element가 Equatable을 만족해야 allEqual 메서드를 사용할 수 있다.
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

// 배열은 Collection을 준수하고 또 Element는 Equatable을 준수하고 있으니 Collection 익스텐션의 allEqual() 메서드를 사용할 수 있습니다.
print(equalNumbers.allEqual())
print(differentNumbers.allEqual())

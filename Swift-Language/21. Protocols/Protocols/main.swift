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

// MARK: - Protocols as Types

// MARK: - Delegation

// MARK: - Adding Protocol Conformance with an Extension

// MARK: Conditionally Conforming to a Protocol

// MARK: Declaring Protocol Adoption with an Extension

// MARK: - Adopting a Protocol Using a Synthesized Implementation

// MARK: - Collections of Protocol Types

// MARK: - Protocol Inheritance

// MARK: - Class-Only Protocols

// MARK: - Protocol Composition

// MARK: - Checking for Protocol Conformance

// MARK: - Optional Protocol Requirements

// MARK: - Protocol Extensions

// MARK: Providing Default Implementations

// MARK: Adding Constraints to Protocol Extensions

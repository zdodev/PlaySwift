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

// MARK: - Mutating Method Requirements

// MARK: - Initializer Requirements

// MARK: Class Implementations of Protocol Initializer Requirements

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

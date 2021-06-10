//MARK: - Access Control
/*
 접근 제어는 코드에 접근할 수 있는 범위를 지정하는 것입니다.
 */

//MARK: - Modules and Source Files
/*
 Swift의 접근 제어 모델은 모듈과 소스 파일에 기초합니다. Xcode는 build target은 별도의 모듈로 취급합니다.
 소스 파일은 모듈 안에 Swift 소스 코드 파일을 말합니다.
 */

//MARK: - Access Levels

// open access, public access: 다른 모듈에 있는 소스 파일에서도 접근할 수 있습니다.

// internal access: 모듈 내에서 접근할 수 있습니다. 기본 접근 수준입니다.

// file-private access: 선언된 소스 파일내에서 접근할 수 있습니다.

// private access: 자신을 둘러싼 선언과 익스텐션 내에서 접근할 수 있습니다.

//MARK: Guiding Principle of Access Levels
/*
 Swift는 어떤 개체도 더 낮은 접근 수준을 가진 다른 개체를 써서 정의할 수 없습니다.
 public 변수는 internal, file-private, private 타입을 가지도록 정의할 수 없습니다.
 함수는 자신의 매개 변수 타입 및 반환 타입보다 더 높은 접근 수준을 가질 수 없습니다.
 */

//MARK: Default Access Levels
// 접근 수준을 명시하지 않으면 기본적으로 internal 수준으로 설정됩니다.

//MARK: Access Levels for Single-Target Apps
// 외부에서 사용할 모듈이 아니므로 internal 접근 수준이면 충분합니다.
// 세부 구현 사항을 숨기기 위해 fileprivate과 private을 사용합니다.

//MARK: Access Levels for Frameworks
/*
 외부에서 사용할 모듈이기 때문에 외부 인터페이스를 open이나 public으로 설정합니다. API 부분만 open과 public으로 설정합니다.
 */

//MARK: Access Levels for Unit Test Targets
/*
 단위 테스트 대상은 @testable import 선언을 하면 internal 개체에 접근할 수 있습니다.
 */

//MARK: - Access Control Syntax

// 클래스
open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

// 함수
public func somePublicFunction() {}
internal func someInternalFunction() {}
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

// 변수, 상수
public let someOpenConstant = 0
internal let someInternalConstant = 0
fileprivate let someFilePrivateConstant = 0
private let somePrivateConstant = 0

//MARK: - Custom Types
/*
 타입의 접근 제어 수준은 타입의 멤버에도 영향을 미칩니다. 타입의 접근 수준을 private이나 fileprivate으로 정의하면 멤버의 기본 접근 수준도 private이나 fileprivate이 됩니다.
 타입의 접근 수준보다 높은 접근 수준을 가진 개체를 선언하는 것은 가능합니다만, 의미가 있을까 싶습니다.
 */

// open 접근 수준
open class SomeOpenClass1 {
    open var someOpenProperty = 0
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    open func someOpenPublicFunction() {}
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

// public 접근 수준
public class SomePublicClass1 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    open func someOpenPublicFunction() {}
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

// internal 접근 수준
class SomeInternalClass1 {
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

// fileprivate 접근 수준
fileprivate class SomeFilePrivateClass1 {
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

// private 접근 수준
private class SomePrivateClass1 {
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

//MARK: Tuple Types
/*
 튜플은 튜플에 사용된 타입 중 접근 수준이 가장 낮은 타입으로 설정됩니다. 튜플은 튜플을 이루는 타입에 의해 접근 수준이 자동으로 결정됩니다.
 */

// 튜플 타입의 수준이 public 이므로 public 튜플 선언 가능
public let somePublicTuple = (1, SomePublicClass1())

// 튜플 타입의 수준이 internal 이므로 internal 튜플 선언 가능
let someInternalTuple = (1, SomeInternalClass1())

// 튜플 타입의 수준이 fileprivate 이므로 fileprivate 튜플 선언 가능
fileprivate let someFilePrivateTuple = (1, SomeFilePrivateClass1())

// SomePrivateClass1 범위가 현재 소스코드
fileprivate let someFilePrivateTuple1 = (1, SomePrivateClass1())

// 튜플 타입의 수준이 private 이므로 private 튜플 선언 가능
private let somePrivateTuple1 = (1, SomePrivateClass1())

//MARK: Function Types
/*
 함수는 매개 변수 타입과 반환 타입 중 접근 수준이 가장 낮은 타입으로 설정됩니다.
 */

// 반환 타입이 public 이므로 public 함수 선언 가능
public func somePublicFunction1() -> SomePublicClass1 {
    SomePublicClass1()
}

// 반환 타입이 internal 이므로 internal 함수 선언 가능
func someInternalFunction1() -> SomeInternalClass1 {
    SomeInternalClass1()
}

// 반환 타입이 fileprivate 이므로 fileprivate 함수 선언 가능
fileprivate func someFilePrivateFunction1() -> SomeFilePrivateClass1 {
    SomeFilePrivateClass1()
}

// SomePrivateClass1 범위가 현재 소스코드
fileprivate func someFilePrivateFunction1() -> SomePrivateClass1 {
    SomePrivateClass1()
}

// 반환 타입이 private 이므로 private 함수 선언 가능
private func somePrivateFunction1() -> SomePrivateClass1 {
    SomePrivateClass1()
}

//MARK: Enumeration Types
/*
 열거형의 case는 열거형의 접근 수준과 동일합니다. 개별 접근 수준을 가질 수 없습니다.
 */

public enum SomePublicEnumeration {
    case open
}

enum SomeInternalEnumeration {
    case open
}

fileprivate enum SomeFilePrivateEnumeration {
    case open
}

private enum SomePrivateEnumeration {
    case open
}

//MARK: Raw Values and Associated Values
/*
 raw values 및 associated values로 사용된 타입은 열거형의 접근 수준만큼 높아야 합니다.
 */

//MARK: Nested Types
/*
 자신을 담은 타입이 public이 아니라면 자신을 담은 타입과 똑같습니다. public 안에서 정의한 중첩 타입은 자동으로 internal 접근 수준을 가집니다.
 */

// public: 외부 모듈에 공개할 것인가
// internal: 내부 모듈에 공개할 것인가
// fileprivate: 소스파일 내부에 공개할 것인가
// private: 나만 사용할 것인가

//MARK: - Subclassing
/*
 현재 접근 상황에서 접근할 수 있으며 동일 모듈에서 하위 클래스로 정의한 어떤 클래스든 하위 클래스로 만들 수 있습니다.
 하위 클래스는 자신의 상위 클래스보다 더 높은 접근 수준을 가질 수 없습니다.
 */

/*
 상위 클래스의 접근 수준보다 더 높게 오버라이드를 하거나 더 낮게 오버라이드를 할 수 있습니다.
 */
public class A {
    public func someMethod() {}
    fileprivate func someFilePrivateMethod() {}
}

class B: A {
    // 접근 수준을 더 낮게
    override func someMethod() {
        super.someMethod()
    }
    
    // 접근 수준을 더 높게
    override func someFilePrivateMethod() {
        super.someFilePrivateMethod()
    }
}

//MARK: - Constants, Variables, Properties, and Subscripts
/*
 상수, 변수, 프로퍼티, 서브스크립트는 자신의 타입보다 더 높은 접근 수준을 가질 수 없습니다.
 상수, 변수, 프로퍼티, 서브스크립트가 private 타입을 사용할 경우, 상수, 변수, 프로퍼티, 서브스크립트도 반드시 private 접근 수준으로 선언해야 합니다.
 */

private var privateInstance = SomePrivateClass()

//MARK: Getters and Setters
/*
 기본적으로 게터와 세터는 자신이 속한 상수, 변수, 프로퍼티, 서브스크립트와 같은 접근 수준을 자동으로 가집니다.
 
 세터는 게터보다 더 낮은 접근 수준을 설정할 수 있습니다. 더 낮은 접근 수준은 다음과 같이 설정합니다.
 internal(set)
 fileprivate(set)
 private(set)
 */

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

public struct TackedString1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

//MARK: - Initializers
/*
 이니셜라이저는 초기화하는 타입보다 더 낮거나 같은 접근 수준을 설정할 수 있습니다. 단, 필수 이니셜라이저는 자신의 클래스 접근 수준과 동일한 수준을 가져야 합니다.
 */

//MARK: Default Initializers
/*
 디폴트 이니셜라이저는 public으로 정의하지 않는 한 자신의 타입과 동일한 접근 수준을 가집니다. public의 경우 internal 수준을 가집니다.
 */

//MARK: Default Memberwise Initializers for Structure Types

//MARK: - Protocols
/*
 정해진 접근 상황일 때만 채택할 수 있는 프로토콜을 생성할 수 있습니다. 프로토콜의 필수 요구사항은 프로토콜과 같은 접근 수준으로 설정됩니다.
 이는 프로토콜을 채택하는 어떤 타입이든 프로토콜의 모든 필수 요구사항을 볼 수 있도록 보장합니다.
 */

public protocol SomePublicProtocol {
    var a: Int { get }
    var b: Int { get set }
    func update()
}

protocol SomeInternalProtocol {
    // ...
}

fileprivate protocol someFilePrivateProtocol {
    // ...
}

private protocol somePrivateProtocol {
    // ...
}

//MARK: Protocol Inheritance
/*
 기존 프로토콜을 상속하여 새로운 프로토콜을 정의할 경우, 하위 프로토콜은 상위 프로토콜보다 더 높은 접근 수준을 가질 수 없습니다.
 */

//MARK: Protocol Conformance
/*
 타입은 타입 자신보다 더 낮은 수준의 프로토콜을 준수할 수 있습니다.
 다른 모듈에서 사용할 수 잇지만 내부 프로토콜에 대한 자신의 준수성은 내부 프로토콜을 정의한 모듈 안에서만 사용할 수 있는 public 타입을 정의할 수 있습니다.
 프로토콜을 준수하기 위해 타입을 작성하거나 확장할 때는 프로토콜 필수 요구사항에 대한 타입의 구현이 적어도 해당 프로토콜에 대한 타입의 준수성과 똑같은 접근 수준을 가지도록 반드시 보장해야 합니다.
 */

struct Excel: somePrivateProtocol {
}

//MARK: - Extensions
/*
 익스텐션에 추가한 타입 어떠한 멤버든 확장 중인 원본 타입에서 선언한 타입 멤버와 똑같은 기본 접근 수준을 가집니다.
 */

//MARK: Private Members in Extensions

protocol PrivateMemberProtocol {
    func doSomething()
}

struct PrivateMemberStruct {
    private var privateVariable = 12
}

extension PrivateMemberStruct: PrivateMemberProtocol {
    // 익스텐션에서 private 프로퍼티 접근
    func doSomething() {
        print(privateVariable)
    }
}

//MARK: - Generics
/*
 제네릭은 제네릭 타입, 함수 자신, 타입 매개변수에 대한 어떤 타입 구속 조건의 접근 수준 중에서의 최소값입니다.
 */

//MARK: - Type Aliases
/*
 타입 별칭은 별명을 붙인 타입의 접근 수준보다 낮거나 같은 접근 수준을 가질 수 있습니다.
 */

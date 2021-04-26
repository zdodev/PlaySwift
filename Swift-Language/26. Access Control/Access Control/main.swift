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

/// Subclassing

public class A {
    fileprivate func someMethod() {}
}

class B: A {
    override func someMethod() {
        super.someMethod()
    }
}

/// Constants, Variables, Properties, and Subscripts

private var privateInstance = SomePrivateClass()

/// Getters and Setters

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

/*
var stringToEdit = TrackedString()
stringToEdit.value = "This is string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
 */
//print("The nubmer of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}

/// Initializers

/// Default Initializers

/// Default Memberwise Initializers for Structure Types

/// Protocols

/// Protocol Inheritance

/// Protocol Conformance

/// Extensions

/// Private Members in Extensions

protocol PrivateMemberProtocol {
    func doSomething()
}

struct PrivateMemberStruct {
    private var privateVariable = 12
}

extension PrivateMemberStruct: PrivateMemberProtocol {
    func doSomething() {
        print(privateVariable)
    }
}

/// Generics

/// Type Aliases

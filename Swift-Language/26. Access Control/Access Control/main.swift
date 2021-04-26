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

// internal access: 모듈 내에서 접근할 수 있습니다.

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

/// Access Control Syntax

open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {} // Defalut Access Level
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public func somePublicFunction() {}
internal func someInternalFunction() {} // Defalut Access Level
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

public let someOpenConstant = 0
internal let someInternalConstant = 0 // Defalut Access Level
fileprivate let someFilePrivateConstant = 0
private let somePrivateConstant = 0

/// Custom Types

public class SomePublicClass1 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

class SomeInternalClass1 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

fileprivate class SomeFilePrivateClass1 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

private class SomePrivateClass1 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}

/// Tuple Types

/// Function Types

/*
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    (SomeInternalClass(), SomePrivateClass())
}
 */

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    (SomeInternalClass(), SomePrivateClass())
}

/// Enumeration Types

public enum CompassPoint {
    case north
    case south
    case east
    case west
}

/// Raw Values and Associated Values

/// Nested Types

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

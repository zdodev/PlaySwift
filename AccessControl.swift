/// Access Control

/// Modules and Source Files

/// Access Levels

/// Guiding Principle of Access Levels

/// Default Access Levels

/// Access Levels for Single-Target Apps

/// Access Levels for Frameworks

/// Access Levels for Unit Test Targets

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

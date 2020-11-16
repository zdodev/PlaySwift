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

/// Enumeration Types

/// Raw Values and Associated Values

/// Nested Types

/// Subclassing

/// Constants, Variables, Properties, and Subscripts

/// Getters and Setters

/// Initializers

/// Default Initializers

/// Default Memberwise Initializers for Structure Types

/// Protocols

/// Protocol Inheritance

/// Protocol Conformance

/// Extensions

/// Private Members in Extensions

/// Generics

/// Type Aliases

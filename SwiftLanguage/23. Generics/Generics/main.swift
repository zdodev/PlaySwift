// MARK: - Generics

// MARK: - The Problem that Generics Solve

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// MARK: - Generic Functions

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

someInt = 3
anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"

swapTwoValues(&someString, &anotherString)

// MARK: - Type Parameters

// MARK: - Naming Type Parameters

// MARK: - Generic Types

// MARK: - Extending a Generic Type

// MARK: - Extending a Generic Type

// MARK: - Type Constraints

// MARK: Type Constraint Syntax

// MARK: Type Constraints in Action

// MARK: - Associated Types

// MARK: Associated Types in Action

protocol Container {
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Stack: Container {
    mutating func append(_ item: Int) {
        
    }
    
    var count: Int
    
    subscript(i: Int) -> Int {
        1
    }
    
//    typealias Item = Int
}

// MARK: Extending an Existing Type to Specify an Associated Type

// MARK: Adding Constraints to an Associated Type

// MARK: Using a Protocol in Its Associated Type's Contraints

// MARK: - Generic Where Clauses

// MARK: - Extensions with a Generic Where Clause

// MARK: - Contextual Where Clauses

// MARK: - Associated Types with a Generic Where Clause

// MARK: - Generic Subscripts

/// The Problem that Generics Solve

// 두 Int형 인자의 값을 서로 바꾸는 함수
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 두 String형 인자의 값을 서로 바꾸는 함수
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 두 Double형 인자의 값을 서로 바꾸는 함수
func swapToDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/// Generic Functions

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
print(someInt, anotherInt)

/// Type Parameters

func follow<TypeParameters>(a: TypeParameters) {
    
}

// multiple type parameters

func follow<Type1, Type2>(a: Type1, b: Type2) {
    
}

/// Naming Type Parameters

func follow<T, U, V>(a: T, b: U, c: V) {
    
}

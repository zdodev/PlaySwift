///// Basic Operators
//
///// Terminology
//
///// Assignment Operator
//
//let b = 10
//var a = 5
//a = b
//print(a, b)
//
//let (x, y) = (1, 2)
//print("x = \(x), y = \(y)")
//
///*
//if x = y {
//    // x = y 구문은 값을 반환하지 않습니다.
//}
// */
//
///// Arithmetic Operators
//
//print(1 + 2)
//print(5 - 3)
//print(2 * 3)
//print(10.0 / 2.5)
//print("hello, " + "world")
//
///// Remainder Operator
//
//print(9 % 4)
//print(-9 % 4)
//
///// Unary Minus Operator
//
//let three = -3
//let minusThree = -three
//let plusThree = -minusThree
//print(three, minusThree, plusThree)
//
///// Unary Plus Operator
//let minusSix = -6
//let alsoMinuxSix = +minusSix
//print(minusSix, alsoMinuxSix)
//
///// Compound Assignment Operators
//
//var addAndAssign = 1
//addAndAssign += 2
//print(addAndAssign)
//
//var subtractAndAssign = 5
//subtractAndAssign -= 3
//print(subtractAndAssign)
//
//var multiplyAndAssign = 3
//multiplyAndAssign *= 4
//print(multiplyAndAssign)
//
//var remainderAndAssign = 7
//remainderAndAssign %= 3
//print(remainderAndAssign)
//
///// Comparison Operators
//
//print(1 == 1)
//print(2 != 1)
//print(2 > 1)
//print(1 < 2)
//print(1 >= 1)
//print(2 <= 1)
//
//let name = "world"
//if name == "world" {
//    print("hello, world")
//} else {
//    print("I'm sorry \(name), but I don't recognize you")
//}
//
//print((1, "zebra") < (2, "apple"))
//print((3, "apple") < (3, "bird"))
//print((4, "dog") == (4, "dog"))
//
//print(("blue", -1) < ("purple", 1))
////print(("blue", false) < ("purple", true))
//
///// Ternary Conditional Operator
//
//let contentHeight = 40
//let hasHeader = true
//let rowHeight = contentHeight + (hasHeader ? 50 : 20)
//print(rowHeight)
//
///// Nil-Coalescing Operator
//
//let defaultColorName = "red"
//var userDefinedColorName: String?
//
//var colorNameToUse = userDefinedColorName ?? defaultColorName
//print(colorNameToUse)
//
//userDefinedColorName = "green"
//colorNameToUse = userDefinedColorName ?? defaultColorName
//print(colorNameToUse)
//
//let myName: String? = nil
//let unwrappedName = myName ?? "Anonymous"
//print("Hello, \(myName ?? "Anonymous")!")
//
//func username(for id: Int) -> String? {
//    if id == 1{
//        return "zdo"
//    } else {
//        return nil
//    }
//}
//print("Hi, \(username(for: 1) ?? "anonymous")")
//
///// Range Operators
//
///// Closed Range Operator
//
//let closedRangeOperator = 1...5
//for index in closedRangeOperator {
//    print("\(index) times 5 is \(index * 5)")
//}
//
///// Half-Open Range Operator
//
//let names = ["Anna", "Alex", "Brian", "Jack"]
//let count = names.count
//for i in 0..<count {
//    print("Person \(i + 1) is called \(names[i])")
//}
//
///// One-Sided Ranges
//
//for name in names[2...] {
//    print(name)
//}
//
//for name in names[...2] {
//    print(name)
//}
//
//for name in names[..<2] {
//    print(name)
//}
//
//let range = ...5
//print(range.contains(7))
//print(range.contains(4))
//print(range.contains(-1))
//
///// Logical Operators
//
//
///// Logical NOT Operator
//
//let allowedEntry = false
//if !allowedEntry {
//    print("ACCESS DENIED")
//}
//
///// Logical AND Operator
//
//let enteredDorrCode = true
//let passedRetinaScan = false
//if enteredDorrCode && passedRetinaScan {
//    print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}
//
///// Logical OR Operator
//
//let hasDoorKey = false
//let knowsOverriedPassword = true
//if hasDoorKey || knowsOverriedPassword {
//    print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}
//
///// Combining Logical Operators
//
//if enteredDorrCode && passedRetinaScan || hasDoorKey || knowsOverriedPassword {
//    print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}
//
///// Explicit Parentheses
//
//if (enteredDorrCode && passedRetinaScan) || hasDoorKey || knowsOverriedPassword {
//    print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}

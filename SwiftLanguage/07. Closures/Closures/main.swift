// MARK: - Closures

// MARK: - Closure Expressions

// MARK: The Sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

// MARK: Closure Expression Syntax

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// MARK: Inferring Type from Context

reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

var inferringType: (Double, Double) -> Bool
inferringType = { height, row in
    return height < row
}

// MARK: Implicit Returns from Single-Expression Closures

reversedNames = names.sorted(by: { s1, s2 in
    s1 > s2
})

var implicitReturn: (Double, Double) -> Bool
implicitReturn = { height, row in
    height < row
}

// MARK: Shorthand Argument Names

reversedNames = names.sorted(by: {
    $0 > $1
})

// MARK: Operator Methods

reversedNames = names.sorted(by: >)

// MARK: - Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    closure()
}

someFunctionThatTakesAClosure() {
    print("closure")
}

reversedNames = names.sorted() {
    $0 > $1
}

reversedNames = names.sorted {
    $0 > $1
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(strings)

// 함수가 다중 클로저 인자를 가질 경우, 첫 번째 클로저의 인자명을 생략하며 두 번째 클로저부터 인자명을 붙여서 호출합니다.

func loadPicture(from server: String?, completion: (String) -> Void, onFailure: () -> Void) {
    if let picture = server {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: "server") { picture in
    print("success: \(picture)")
} onFailure: {
    print("실패")
}

// MARK: - Capturing Values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

print(incrementByTen())

// MARK: - Closures are Reference Types

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
print(incrementByTen())

// MARK: Escaping Closures

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

/*
 Escaping Closure에 self를 명시적으로 선언해야 하는 이유
 Escaping closure는 외부 변수에서 저장되고 사용할 수 있는데, 이때 캡처한 변수를 확실하게 알려주기 위해서 self를 사용해야 한다.
 
 일반 closure는 함수 내부에서 클로저가 실행되기 때문에 내부에 있는 프로퍼티를 사용한다는 것을 확신할 수 있기 때문에 명시하지 않아도 된다.
 
 self를 명시하는 방법
 프로퍼티 접근 시 self를 사용한다. 또는
 클로저 파라미터 정의 부분에서 [self]를 명시한다.
 */

class SomeClass {
    var x = 0
    
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

class SomeOtherClass {
    var x = 10
    
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in
            x = 100
        }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

/*
 구조체와 열거형의 경우 self에 대해 항상 암시적으로 참조합니다. 구조체와 열거형의 경우 변경 가능성에 대해서 공유하지 않으므로, escaping closure가 변경 가능성이 있는 참조로 캡처할 수 없습니다.
 */

import Foundation

struct SomeStruct {
    var x = 10
    
    // mutating의 경우 self가 변경 가능하기 때문에 escaping closure가 구조체에 대해 self를 캡처할 수 없다.
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }
//        someFunctionWithEscapingClosure { self.x = 100 } error
    }
}

// MARK: - Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("customersInLine: \(customersInLine.count)")

let customerProvider = {
    customersInLine.remove(at: 0)
}
print("customersInLine: \(customersInLine.count)")

print("Now serving \(customerProvider())!")
print("customersInLine: \(customersInLine.count)")

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve {
    customersInLine.remove(at: 0)
}
print("customersInLine: \(customersInLine.count)")

// () -> String 타입을 마치 String인 것처럼 호출할 수 있다.
// autoclosures는 파라미터가 없어야 한다.

func serve(customer customerProvider: @autoclosure () -> String) {
    // customerProvider를 실행하기 전까지 remove를 실행하지 않는다.
    // customerProvider를 실행해야 비로소 remove가 실행되면서 배열의 요소가 하나 줄어든다.
    print("now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
print("customersInLine: \(customersInLine.count)")

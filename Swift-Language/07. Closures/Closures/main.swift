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

// sorted(by:) 메서드의 파라미터 타입: (String, String) -> Bool

/*
 클로저 정의
 { (s1: String, s2: String) -> Bool in
     return s1 > s2
 }
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


// MARK: Inferring Type from Context

// sorted(by:) 파라미터는 (String, String) -> Bool 타입을 받으므로 클로저에서 파라미터 타입과 리턴 타입을 생략해도 타입을 추론할 수 있다.

/*
 파라미터 타입과 리턴 타입을 생략한 클로저
 { s1, s2 in
     return s1 > s2
 }
 */
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

// MARK: Implicit Returns from Single-Expression Closures

reversedNames = names.sorted(by: { s1, s2 in
    s1 > s2
})

// MARK: Shorthand Argument Names

// sorted(by:) 파라미터는 (String, String) -> Bool 타입을 받으므로 인자명을 정의하지 않고 $0, $1와 같이 단축 인자명을 사용할 수 있으며 in 키워드를 생략할 수 있다.

/*
 파라미터명과 in 키워드를 생략한 클로저
 {
     $0 > $1
 }
 */

reversedNames = names.sorted(by: {
    $0 > $1
})

// MARK: Operator Methods

// sorted(by:) 파라미터는 (String, String) -> Bool 타입을 받는다. 그리고 (String, String) -> Bool 이 구현된 연산자가 있을 경우 연산자만을 사용하여 클로저를 표현할 수 있다.

// static func > (lhs: String, rhs: String) -> Bool

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
        someFunctionWithEscapingClosure { [self] in
            x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//var a = 3
//someFunctionWithEscapingClosure {
//    a = 4
//}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)

let customerProvider = {
    customersInLine.remove(at: 0)
}
//print(customersInLine.count)

//customerProvider()
//print(customersInLine.count)

func serve(customer customerProvider: @autoclosure () -> String) {
    print(customerProvider())
}

//serve(customer: {
//    customersInLine.remove(at: 0)
//})

//serve(customer: c)

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    operation(n1, n2)
}

func add(no1: Int, no2: Int) -> Int {
    no1 + no2
}

func multiply(no1: Int, no2: Int) -> Int {
    no1 * no2
}

print(calculator(n1: 2, n2: 3, operation: add))
print(calculator(n1: 2, n2: 3, operation: multiply))

print(calculator(n1: 2, n2: 3) {
    $0 * $1
})

let array = [6, 2, 3, 9, 4, 1]

func addOnt(n1: Int) -> Int {
    n1 + 1
}

print(array.map {
    $0 + 1
})


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


var completionHandlers: [() -> Void] = []
var fun: () -> Void = {}
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
    fun = completionHandler
}
var a = 3
someFunctionWithEscapingClosure {
    a = 4
}

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


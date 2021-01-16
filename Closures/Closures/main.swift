import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

// 완전한 클로저 표현식
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 타입 추론으로 타입을 생략 클로저
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

// 단일 표현식으로 return 키워드 생략 클로저
reversedNames = names.sorted(by: { s1, s2 in
    s1 > s2
})

// 단축 인자 표현으로 인자명 생략 클로저
reversedNames = names.sorted(by: {
    $0 > $1
})

// 연산자 메서드 클로저
reversedNames = names.sorted(by: >)

// 후행 클로저
func someFunctionThatTakesAClosure(closure: () -> Void) {
    closure()
}

someFunctionThatTakesAClosure {
    print("closure")
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

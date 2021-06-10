# Closures

클로저는 독립된 코드 블럭입니다. 클로저는 자기 주변의 상수와 변수를 캡처하여 저장할 수 있는 이름없는 함수라고 생각해 볼 수 있습니다. 함수는 이름을 가지는 클로저입니다. 반면에 클로저는 자기 주변의 상수와 변수를 캡처할 수 있는 이름없는 독립된 함수라고 볼 수 있습니다.

## Closure Expressions

클로저는 모든 구문을 명시적으로 작성해야 하는 함수와 달리 여러 구문을 생략하고 정의할 수 있는 기능을 제공합니다.

### The Sorted Method

`sorted(by:)` 메서드는 전달된 클로저를 기준으로 정렬하는 메서드입니다.

```swift
// 정렬하려는 배열
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sorted(by:) 메서드에 전달하기 위해 함수(클로저) 정의
func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}

// 내림차순으로 정렬
var reversedNames = names.sorted(by: backward)
print(reversedNames)
// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

### Closure Expression Syntax

다음과 같이 클로저를 정의할 수 있습니다. 클로저는 inout 매개변수를 선언할 수 없습니다.

```swift
{ (s1: String, s2: String) -> Bool in
 return s1 > s2
}
```

다음과 같이 sorted(by:) 메서드 전달인자로 함수 대신 클로저를 사용할 수 있습니다.

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

### Inferring Type from Context

클로저를 메서드 전달인자로 전달하기 위해서 정의할 때는 Swift가 클로저의 매개변수 타입과 반환 타입을 추론할 수 있습니다. 왜? 🤔 sorted(by:) 메서드의 매개변수 타입은 (String, String) -> Bool 입니다. 이는 sorted(by:) 메서드에 클로저를 전달할 때 클로저의 매개변수 타입과 반환 타입을 명시하지 않아도 Swift가 알아서 추론할 수 있습니다.

-> 메서드 매개변수에 정의된 타입을 보고 Swift가 알아서 클로저의 매개변수와 반환 값을 추론할 수 있습니다!

다음은 매개변수 타입과 반환 값 타입이 생략된 클로저입니다.

```swift
// 매개변수 타입과 반환 값 타입을 생력한 클로저
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})
```

물론 생략한 타입을 명시할 수도 있습니다. 무조건 생략해서 간략하게 표현하는 것보다 타입을 명시하여 가독성이 더 좋아진다면 명시하는 것이 좋습니다.

```swift
var inferringType: (Double, Double) -> Bool
// 매개변수 타입과 반환 값 타입을 생력한 클로저
inferringType = { param1, param2 in
    return param1 < param2
}
```

### Implicit Returns from Single-Expression Closures

함수, 메서드와 동일하게 클로저도 return 키워드를 생략한 단일 표현식 구문을 사용할 수 있습니다.

```swift
// return 키워드를 생략한 클로저
reversedNames = names.sorted(by: { s1, s2 in
    s1 > s2
})

var implicitReturn: (Double, Double) -> Bool
// return 키워드를 생략한 클로저
implicitReturn = { height, row in
    height < row
}
```

### Shorthand Argument Names

클로저에서는 매개변수명 조차 생략할 수 있습니다. 매개변수명을 생략하고 $0, $1과 같이 단축 표현을 사용할 수 있습니다. 매개변수명, 매개변수 타입, 반환 타입까지 생략하면 in 키워드도 생략할 수 있습니다.

```swift
// 매개변수명, 반환 타입, in 키워드 생략
reversedNames = names.sorted(by: {
    $0 > $1
})
```

### Operator Methods

sorted(by:) 파라미터는 (String, String) -> Bool 타입을 받습니다. 그리고 (String, String) -> Bool 이 구현된 연산자가 있을 경우 연산자만을 사용하여 클로저를 표현할 수 있습니다. Swift는 연산자를 보고 연산자의 구현을 추론합니다.

```swift
// static func > (lhs: String, rhs: String) -> Bool
reversedNames = names.sorted(by: >)
```


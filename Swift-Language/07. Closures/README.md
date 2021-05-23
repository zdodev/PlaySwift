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




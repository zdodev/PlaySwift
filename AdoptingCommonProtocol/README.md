# Swift 공통 프로토콜 채택하여 사용하기 (Adopting Common Protocols)

사용자 정의 타입에 Swift 프로토콜을 채택하여 쉽게 기능을 추가할 수 있습니다.

## 개요

사용자 정의 타입을 구현할 때 두 값이 동일한지 비교하거나 특정 값을 포함하고 있는 확인 하고 싶을 때가 있습니다. 이러한 기능은 값을 집합에 저장하거나 딕셔너리의 키로 사용할 때 주로 사용합니다. Swift 표준 라이브러리에 정의된 **Equatable**과 **Hashable** 프로토콜을 사용하면 이러한 기능을 사용할 수 있습니다.

- Equatable 프로토콜을 사용하면 두 인스턴스의 동등성(==, !=)을 비교할 수 있습니다.
- 해시 가능한 타입의 인스턴스는 수학적으로 단일 정수로 줄일 수 있으며, 이는 집합과 사전에서 내부적으로 검색을 빠르게 수행할 수 있습니다.

Swift 표준 라이브러리의 많은 타입(String, Int, Double, Bool, 컬렉션)은 Equatable과 Hashable을 준수하고 있습니다.

```swift
let username = "Arturo"
if username == "Arturo" {
    print("Hi, arturo!")
}
// Hi, arturo!

let today = 8
let favoriteNumbers = [4, 7, 8, 9]
if favoriteNumbers.contains(today) {
    print("It's a good day today!")
}
// It's a good day today!
```

## 자동으로 Equatable과 Hashable 프로토콜 준수하기

사용자 정의 타입을 정의함과 동시에 Equatable과 Hashable 프로토콜을 채택하면 컴파일러는 자동으로 프로토콜에 대한 요구사항을 만듭니다. Equatable 프로토콜을 준수하면 동등 연산(==)과 동등하지 않은 연산(!=)을 사용자 정의 타입에서 사용할 수 있습니다. Hashable 프로토콜을 준수하면 집합에 저장할 수 있으며 빠르게 탐색할 수 있습니다.

```swift
struct Position: Equatable, Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    if gemPosition == position {
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}
// No gem at (0, 0)
// No gem at (0, 1)
// Gem found at (1, 0)!

var visitedPositions: Set = [Position(0, 0), Position(1, 0)]
let currentPosition = Position(1, 3)

if visitedPositions.contains(currentPosition) {
    print("Already visited (\(currentPosition.x), \(currentPosition.y)")
} else {
    print("First time at (\(currentPosition.x), \(currentPosition.y))")
}
// First time at (1, 3)
```

컴파일러가 자동으로 준수하는 코드를 생성하는 것은 코드를 단순하게 만들어주기도 하고 사용자 정의 타입에 추가하는 모든 프로퍼티를 사용하여 해싱과 동등성을 테스트하기 때문에 오류를 줄여주기도 합니다. 이러한 자동 준수는 구조체와 열거형에서 다음 기준을 충족해야 합니다.

- 구조체의 경우 모든 프로퍼티가 Equatable과 Hashable 프로토콜을 준수해야 합니다.
- 열거형의 경우 모든 연관 값이 Equatable과 Hashable 프로토콜을 준수해야 합니다. 연관 값을 선언하지 않으면 자동으로 기준을 만족합니다.

## 수동으로 Equatable과 Hashable 프로토콜 준수하기

이전의 자동 준수 기준을 충족하지 않거나, 사용자가 직접 동등성과 해시를 정의하려고 하거나, 다른 파일이나 모듈에서 선언된 유형을 확장하기 위해서는 수동으로 프로토콜의 요구사항을 정의해야 합니다.

```swift
class Player {
    var name: String
    var position: Position
    
    init(name: String, position: Position) {
        self.name = name
        self.position = position
    }
}
```

위에서 정의한 클래스 Player는 자동 준수 기준을 충족하지 않습니다. 그래서 프로토콜을 채택하고 요구사항을 정의해야 합니다. Equatable 프로토콜을 만족하기 위해서는 static == 연산자 메서드를 정의해야 합니다.

```swift
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.position == rhs.position
    }
}
```

Hashable 프로토콜을 만족하기 위해서는 hash 메서드를 정의해야 합니다.

```swift
extension Player: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(position)
    }
}
```

### Use All Significant Properties for Equatable and Hashable

== 연산자 메서드와 `hash(into:)` 메서드를 구현할 때, 사용자 정의 타입 내 동등 비교에 영향을 줄 수 있는 모든 프로퍼티를 사용하여 구현합니다. 위 예제에서는 name, position 프로퍼티를 모두 사용하여 구현했습니다.

> ❗️ 동등 비교에 영향을 주지 않는 프로퍼티는 제외합니다. == 메서드에 사용된 프로퍼티와 `hash(into:)` 메서드에 사용된 프로퍼티를 항상 동일하게 사용해야 합니다. 서로 다른 프로퍼티를 사용하여 정의할 경우 예기치 않은 동작 또는 성능에 문제가 발생할 수 있습니다.

## Customize NSObject Subclass Behavior

NSObject 클래스를 상속받아서 동등성과 해시를 기능을 제공할 수도 있습니다. NSObject를 상속받는 서브클래스에서 Equatable과 Hashable 기능을 구현하려면 `isEqual(_:)` 메서드와 `hash` 프로퍼티를 재정의해야 합니다.

```swift
class MyNSObjectSubclass: NSObject {
    let firstProperty = 1
    let secondProperty = 2
}

extension MyNSObjectSubclass {
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MyNSObjectSubclass else {
            return false
        }

        return self.firstProperty == other.firstProperty && self.secondProperty == other.secondProperty
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(firstProperty)
        hasher.combine(secondProperty)
        return hasher.finalize()
    }
}
```

같다고 판단되는 인스턴스는 같은 해시값을 가져야 하므로 하나의 기능을 재정의할 경우 다른 기능도 재정의하여 동일성을 유지해야 합니다.

### 참고 URL

---

>[Apple Adopting Common Protocols](https://developer.apple.com/documentation/swift/adopting_common_protocols)

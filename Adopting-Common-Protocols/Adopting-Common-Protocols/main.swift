import Foundation

/// Adopting Common Protocols

/// Overview

/*
 보통 사용자 정의 타입을 구현할 때 두 값이 동일한 지 비교하거나 특정한 값을 포함하고 있는지 확인할 때가 있습니다. 셋에 값을 저장하거나 딕셔너리의 키로 사용할 때 주로 사용합니다. Swift Standard Library에 정의된 Equatable과 Hashable 프로토콜을 사용하면 이러한 기능을 사용할 수 있습니다.
 기본으로 제공하는 타입인 Int, Double, String과 콜렉션 타입들은 Equatable 프로토콜과 Hashable 프로토콜을 만족합니다.
 */

let username = "Arturo"
// String의 equatable 기능
if username == "Arturo" {
    print("Hi, Arturo!")
}

let today = 8
let favoriteNumbers = [4, 7, 8, 9]
// Int의 equatable 기능
if favoriteNumbers.contains(today) {
    print("It's a good day today!")
}

/// Conform Automatically to Equatable and Hashable

/*
 사용자가 정의한 타입에 Equtable 프로토콜과 Hashable 프로토콜을 채택하면 동등 비교와 해시 기능을 사용할 수 있습니다. 해당 프로토콜 채택 시 컴파일러가 자동으로 필요한 기능을 구현합니다.
 */

// A position in an x-y coordinate system.
// 프로토콜을 준수하기 위한 기능은 컴파일러 자동으로 구현합니다.
struct Position: Equatable, Hashable {
    var x: Int
    var y: Int

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

// Equatable 프로토콜을 준수하는 Position 타입의 동등 연산에 대한 예시입니다.

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    if gemPosition == position {
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}

// Hashable 프로토콜을 준수하므로 셋 연산에도 사용할 수 있습니다.

var visitedPositions: Set = [Position(0, 0), Position(1, 0)]
let currentPosition = Position(1, 3)

if visitedPositions.contains(currentPosition) {
    print("Already visited (\(currentPosition.x), \(currentPosition.y))")
} else {
    print("First time at (\(currentPosition.x), \(currentPosition.y))")
    visitedPositions.insert(currentPosition)
}

/*
 모든 경우에 대해서 컴파일러가 Equatable과 Hashable 프로토콜 기능을 구현해주는 것은 아닙니다. 자동으로 기능을 구현하기 위해 두 가지 조건을 만족해야 합니다.

 - 구조체의 경우 모든 저장 프로퍼티가 Equatable과 Hashable 프로토콜을 준수해야 합니다.
 - 열거형의 경우 모든 연관값이 Equatable과 Hashable 프로토콜을 준수해야 합니다. 다만 연관값을 정의하지 않을 경우 Equatable과 Hashable 프로토콜을 채택하지 않아도 자동으로 구현됩니다.
 */

/// Conform Manually to Equatable and Hashable

/*
 필요에 따라 수동으로 구현할수도 있는데 다음과 같은 유형이 있습니다.

 - 자동으로 구현되지 않을 경우
 - Equatable과 Hashable 기능을 커스터마이징을 하고 싶은 경우
 - 다른 파일이나 모듈에서 선언된 타입에 대해 Equatable과 Hashable 기능을 추가하고 싶은 경우

 아래 Player 클래스의 경우 자동 구현 조건에 해당되지 않기 때문에 수동으로 구현해주어야 합니다.
 */

class Player {
    var name: String
    var position: Position

    init(name: String, position: Position) {
        self.name = name
        self.position = position
    }
}

// Equatable 프로토콜을 채택하고 해당 기능을 구현하는 예시입니다.

extension Player: Equatable {
    static func ==(lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.position == rhs.position
    }
}

// ashable 프로토콜을 채택하고 해당 기능을 구현하는 예시입니다.

extension Player: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(position)
    }
}

/// Use All Significant Properties for Equatable and Hashable

/*
 == 메서드와 hash(into:) 메서드를 구현할 때, 사용자 정의 타입 내 동등 비교에 영향을 줄 수 있는 모든 프로퍼티를 사용하여 구현합니다. 위 예제에서는 name, position 프로퍼티를 모두 사용하여 구현했습니다.

 동등 비교에 영향을 주지 않는 프로퍼티는 제외합니다. == 메서드에 사용된 프로퍼티와 hash(into:) 메서드에 사용된 프로퍼티를 항상 동일하게 사용해야 합니다. 서로 다른 프로퍼티를 사용하여 정의할 경우 예기치 않은 동작 또는 성능에 문제가 발생할 수 있습니다.
 */

/// Customize NSObject Subclass Behavior

/*
 NSObject를 상속받는 서브클래스에서 Equatable과 Hashable 기능을 구현하려면 isEqual(_:) 메서드와 hash 프로퍼티를 재정의해야 합니다.
 */

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

/*
 동일하다고 판단되는 인스턴스는 동일한 해시값을 가져야 하므로 하나의 기능을 재정의 할 경우 다른 기능도 재정의하여 동일성을 유지해야 합니다.
 */

// https://developer.apple.com/documentation/swift/adopting_common_protocols

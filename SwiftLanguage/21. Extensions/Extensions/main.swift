// MARK: - Extensions

// MARK: - Extension Syntax

enum SomeEnum {}

// 타입을 확장할 수 있다.
extension SomeEnum {
    
}

protocol SomeProtocol {}
protocol AnotherProtocol {}

// 기존 타입에 프로토콜을 추가로 채택할 수 있다.
extension SomeEnum: SomeProtocol, AnotherProtocol {
    
}

// MARK: - Computed Properties

// 기존의 Double 타입을 확장, computed property를 확장한다.
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100.0
    }
    var mm: Double {
        return self / 1_000.0
    }
    var ft: Double {
        return self / 3.28084
    }
}

// Double 타입을 사용할 때 어디서든 사용할 수 있다.
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters.")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters.")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long.")

// extention은 computed property를 추가할 수 있지만, stored property와 property observer는 추가할 수 없습니다.

// MARK: - Initializers

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defalutRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

// 구조체에 새로운 init 추가
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// extension에서 새로 추가한 init으로 Rect 객체 생성
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// extension은 클래스에 convenience init을 추가할 수 있지만, init과 deinit을 추가할 수 없습니다.

// MARK: - Methods

// extension은 instance method와 type method를 추가할 수 있습니다.

// Int 타입에 instance method를 추가합니다.
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    static func hello() {
        print("Hello.")
    }
}

3.repetitions {
    print("Hello!")
}

Int.hello()

// MARK: Mutating Instance Methods

// 구조체와 열거형에서 mutating 메서드를 추가할 수 있습니다.

// mutating square 메서드를 추가합니다.
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)

// MARK: - Subscripts

// subscript를 추가합니다.
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(746381295[0])
print(746381295[1])
print(746381295[2])
print(746381295[8])

// MARK: - Nested Types

extension Int {
    // nested type인 열거형을 정의합니다.
    enum Kind {
        case negative, zero, positive
    }
    
    // computed property를 추가합니다.
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
            
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

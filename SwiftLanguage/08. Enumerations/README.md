# Enumerations (열거형)

열거형은 관련된 값의 그룹입니다. 공통의 타입을 정의하여 이 값을 안전하게 사용할 수 있는 기능을 제공해줍니다. Swift의 열거형은 다른 언어에 비해 유연하고 많은 기능을 제공해줍니다.

## Enumeration Syntax

열거형은 enum 키워드를 사용하여 정의하며 값은 case 키워드를 사용합니다.

```swift
// enum 키워드를 사용하여 열거형을 정의합니다.
enum SomeEnumeration {
    
}

// case 키워드를 사용하여 열거형의 값(케이스)을 정의합니다.
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 케이스값을 가로로 나열하여 정의할 수 있습니다.
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 열거형 변수를 생성할 때, 타입명.케이스값으로 생성할 수 있습니다.
var directionToHead = CompassPoint.west
// 한번 열거형으로 생성한 변수는 타입명을 생략하고 케이스값으로 값을 변경할 수 있습니다.
directionToHead = .east
```

## Matching Enumeration Values with a Switch Statement

열거형과 switch 문은 문법적으로 잘 어울립니다. 열거형의 케이스값을 switch 문의 case에 대입하여 각각의 경우에 대해서 처리하는 구문을 작성할 수 있습니다.

```swift
directionToHead = .south

// switch - 열거형 타입
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth

// switch - 열거형 타입 (feat. default)
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
```

## Iterating over Enumeration Cases

열거형과 반복문도 문법적으로 잘 어울립니다. 열거형에 CaseIterable 프로토콜을 채택하면 모든 케이스에 대한 배열을 얻을 수 있습니다.

```swift
// CaseIterable 프로토콜 채택
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

// case의 수
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

// 각 case에 접근
for beverage in Beverage.allCases {
    print(beverage)
}
```

## Associated Values

연관 값은 각 케이스에 임의의 값을 할당하는 것을 말합니다. 케이스와 관련된 값이라고 생각할 수 있습니다. 서로 다른 타입의 값을 저장할 수 있습니다.

```swift
enum Barcode {
    // 케이스(연관 값...)
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 연관 값을 포함하여 열거형 변수 선언
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

switch productBarcode {
// 연관 값 바인딩
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

productBarcode = .qrCode("ABCDEFG")

switch productBarcode {
// 연관 값 바인딩
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}
```

## Raw Values

원시 값은 열거형에 모두 같은 타입으로 값을 미리 할당할 수 있는 기능입니다.

```swift
// 열거형 이름: (원시 값 타입)
enum ASCIIControlCharacter: Character {
    // 원시 값 할당
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```

### Implicitly Assigned Raw Values

원시 값이 정수형이거나 문자열일 때, Swift에서는 자동으로 값을 할당합니다. 정수형의 경우 첫 케이스부터 0을 할당하여 순차적으로 증가시킵니다. 문자열의 경우 케이스의 이름을 문자열로 할당합니다.

```swift
enum Planet1: Int {
    // 첫 케이스가 1로 할당되면, 나머지는 2, 3, 4,... 순으로 할당됩니다.
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint1: String {
    // 문자열의 경우 케이스 이름이 문자열로 할당됩니다.
    case north, south, east, west
}

// 열거형의 원시 값은 rawValue 프로퍼티로 접근합니다.
let earthOrder = Planet1.earth.rawValue
print("earthOrder = \(earthOrder)")

let sunsetDirection = CompassPoint1.west.rawValue
print("sunsetDirection = \(sunsetDirection)")
```

### Initializing from a Raw Value

원시 값을 사용할 수 있는 열거형의 경우 원시 값을 사용하여 열거형을 생성할 수 있습니다. (열거형에서 원시 값을 받는 이니셜라이저가 생성됩니다.) 열거형이 정의하지 않은 원시 값을 받을 경우 열거형 변수를 생성할 수 없으므로 nil이 반환됩니다. 그래서 열거형의 이니셜라이저는 실패 가능한 이니셜라이저이며, 반환 값은 옵셔널입니다.

```swift
// 원시 값 7을 전달하여 열거형 변수 생성
let possiblePlanet = Planet1(rawValue: 7)
print("possiblePlanet = \(possiblePlanet)")

let positionToFind = 11
// 원시 값 11을 전달하여 열거형 변수 옵셔널 바인딩
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
```

## Recursive Enumerations

순환 열거형은 열거형 케이스의 연관 값 타입이 자기 자신일 때 사용하는 문법입니다. 순환 열거형은 indirect 키워드를 사용하며 컴파일러에 순환적임을 알립니다.

```swift
enum ArithmeticExpression {
    case number(Int)
    // 연관 값의 타입이 자기 자신일때 순환 열거형 indirect를 사용해야 한다.
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 전체 케이스에 대해서 indirect를 선언하려면 enum 키워드 앞에 indirect를 선언한다.
indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 순환 열거형을 사용한 (5 + 4) * 2 수식 연산
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 18
```


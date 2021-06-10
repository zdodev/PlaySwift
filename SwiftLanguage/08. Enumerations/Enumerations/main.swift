// MARK: Enumeration Syntax

// 열거형 정의 문법
enum SomeEnumeration {
    
}

// 열거형 케이스(값) 할당 방법
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 케이스를 가로로 나열할 수 있습니다.
enum Planet {
    case mercury, venur, earth, mars, jupiter, saturn, uranus, nepture
}

// 열거형 변수 선언
var directionToHead = CompassPoint.west

// 열거형 타입이 정해지면 타입명을 생략하고 '.' 표현을 통해 값을 변경할 수 있습니다.
directionToHead = .east

// MARK: - Matching Enumeration Values with a Switch Statement

directionToHead = .south

// switch 문의 케이스 조건에 할당할 수 있습니다.
switch directionToHead {
case .north:
    print("Lots of planets have a north.")
case .south:
    print("Watch out for penguins.")
case .east:
    print("Where the sun rises.")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth

// default 케이스를 사용할 수도 있습니다.
switch somePlanet {
case .earth:
    print("Mostly harmless.")
default:
    print("Not a safe place for humans.")
}

// MARK: - Iterating over Enumeration Cases

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available.")

for beverage in Beverage.allCases {
    print(beverage)
}

enum CompassDirection: CaseIterable {
    case north, south, east, west
}

print("There are \(CompassDirection.allCases.count) directions.")

let caseList = CompassDirection.allCases.map {
    "\($0)"
}.joined(separator: ", ")
print(caseList)

// MARK: - Associated Values

// 열거형 케이스에 추가적인 정보를 연결한 값, 연관값
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 연관값을 지정하여 열거형 변수 생성
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)

// 다른 케이스 생성 시에도 연관값을 지정한다.
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// switch문에서 각 연관값 바인딩해서 사용하기
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

productBarcode = .upc(17, 17, 17, 71)

// switch문에서 전체 연관값 바인딩해서 사용하기
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

// MARK: - Raw Values

// Associated Value는 케이스의 추가정보를 가지고 있는 연관값이라면 Raw Value는 모두 같은 타입의 기본값
// Associated Value는 변수 생성 시 전달한 값에 의해 초기화되지만 Raw Value는 선언 시 입력한 값으로 고정된다.

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// MARK: Implicitly Assigned Raw Values

// 정수형 Raw Value 선언 시 자동으로 1씩 증가하며 정의된다. 정의하지 않으면 기본값은 0부터 시작한다.
enum PlanetRawValue: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, nepture
}

// 문자열 Raw Value 선언 시 각 케이스의 이름 문자열이 정의된다.
enum CompassPointRawValue: String {
    case north, south, east, west
}

let earthsOrder = PlanetRawValue.earth.rawValue
print(earthsOrder)

let sunsetDirection = CompassPointRawValue.west.rawValue
print(sunsetDirection)

// MARK: Initializing from a Raw Value

// Raw Value로 열거형 생성하기.
// Raw Value가 없을 수 있으므로 옵셔널이다.
let possiblePlanet = PlanetRawValue(rawValue: 7)
print(possiblePlanet!)

let positionToFind = 11
if let somePlanet = PlanetRawValue(rawValue: 11) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless.")
    default:
        print("Not a safe place for humans.")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// MARK: - Recursive Enumerations

// 자기 자신의 타입에 대한 Associated Value를 가지는 열거형
// indirect를 써야한다.
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 전체 케이스에 대해서 indirect를 선언하려면 enum 키워드 앞에 indirect를 선언한다.
indirect enum ArithmeticExpressionIndirect {
    case number(Int)
    case addition(ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
    case multiplication(ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
}
// Associated Value = 5
let five = ArithmeticExpressionIndirect.number(5)
// Associated Value = 4
let four = ArithmeticExpressionIndirect.number(4)
// Associated Value = (ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
let sum = ArithmeticExpressionIndirect.addition(five, four)
// Associated Value = (ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
let product = ArithmeticExpressionIndirect.multiplication(sum, ArithmeticExpressionIndirect.number(2))

func evaluate(_ expression: ArithmeticExpressionIndirect) -> Int {
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

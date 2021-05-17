# Structures and Classes

Swift의 구조체와 클래스 모두 타입을 정의하기 위한 기능을 제공합니다. 구조체와 클래스에 프로퍼티와 메서드를 정의하고 사용할 수 있습니다.

## Comparing Structures and Classes

구조체와 클래스의 공통점은 다음과 같습니다.

- 값을 저장하기 위한 프로퍼티를 정의할 수 있습니다.
- 기능을 제공하기 위한 메서드를 정의할 수 있습니다.
- 서브스크립트 문법으로 값에 접근할 수 있는 서브스트립트를 정의할 수 있습니다.
- 초기 상태를 지정할 수 있는 이니셜라이저를 정의할 수 있습니다.
- 기본 구현에서 기능을 추가할 수 있도록 확장할 수 있습니다.
- 특정 종류의 표준 기능을 제공하는 프로토콜을 준수합니다.

클래스는 구조체에 없는 다음과 같은 특징이 있습니다.

- 상속을 지원합니다. 한 클래스가 다른 클래스를 상속하도록 해줍니다.
- 타입 캐스팅을 지원합니다. 클래스 인스턴스의 타입을 실행 시간에 검사합니다.
- 디이니셜라이저를 지원합니다. 인스턴스가 해제될 때, 필요한 작업을 작성할 수 있습니다.
- 레퍼런스 카운팅을 지원합니다. 여러 변수가 하나의 클래스 인스턴스를 참조할 수 있습니다.

클래스는 위와 같은 추가적인 기능을 제공하기 때문에 연산 비용이 구조체보다 더 많이 필요합니다. 따라서, 일반적으로 구조체를 사용하며 클래스는 필요할 때만 사용하는 것이 좋습니다.

### Definition Syntax

구조체는 `struct`, 클래스는 `class` 키워드를 사용하여 정의합니다.

```swift
// 구조체 정의
struct Resolution {
    var width = 0
    var height = 0
}

// 클래스 정의
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

### Structure and Class Instances

정의한 구조체와 클래스를 사용하기 위해서 인스턴스를 생성해야 합니다. 다음과 같이 인스턴스를 생성할 수 있습니다.

```swift
// 구조체의 인스턴스 생성
let someResolution = Resolution()
// 클래스의 인스턴스 생성
let someVideoMode = VideoMode()
```

### Accessing Properties

"." 구문 표현을 사용하여 인스턴스 내 프로퍼티에 접근할 수 있습니다.

```swift
// someResolution의 width 프로퍼티에 접근
print("The width of someResolution is \(someResolution.width)")
// The width of someResolution is 0

// 연속 접근
print("The width of someVedieMode is \(someVideoMode.resolution.width)")
// The width of someVedieMode is 0

// 프로퍼티 값 변경 접근
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// The width of someVideoMode is now 1280
```

### Memberwise Initializers for Structure Types

구조체는 기본적으로 인스턴스의 프로퍼티를 초기화할 수 있는 멤버와이즈 이니셜라이즈가 제공됩니다. 멤버와이즈 이니셜라이즈를 사용하여 인스턴스 프로퍼티를 초기화할 수 있습니다.

```swift
// 멤버와이즈 이니셜라이저를 사용한 초기화
let vga = Resolution(width: 640, height: 480)
print("vga = \(vga.width), \(vga.height)")
// vga = 640, 480
```

## Structures and Enumerations are Value Types

구조체와 열거형은 값 타입입니다. 값 타입은 변수나 상수에 할당하거나 함수의 전달인자로 전달할 때 값이 복사되서 전달됩니다. Swift의 모든 기본 타입(정수, 실수, 논리, 문자열, 배열, 딕셔너리)은 구조체입니다. 값 타입의 특징은 다음과 같습니다.

- 메모리의 스택 영역에 할당됩니다.
- call by value 형태를 가집니다.
- 클래스 타입의 프로퍼티는 값이 복사되지 않고 값의 참조만 복사됩니다.
- 상수를 선언하는 let 키워드는 스택 영역에 값을 수정할 수 없도록 제한하는 키워드입니다. let 키워드로 생성한 인스턴스는 그 값을 변경할 수 없습니다.

```swift
// 구조체 hd 상수
let hd = Resolution(width: 1920, height: 1080)
// hd를 cinema 변수에 할당(복사)
var cinema = hd
// cinema의 width 프로퍼티의 값만 변경된다. hd의 값은 변경되지 않는다.
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// cinema is now 2048 pixels wide
print("hd is still \(hd.width) pixels wide")
// hd is still 1920 pixels wide

enum CompassPoint {
    case north, south, east, west
    
    mutating func turnNorth() {
        self = .north
    }
}

// 열거형 currentDirection 변수
var currentDirection = CompassPoint.west
// currentDirection을 rememberedDirection 상수에 할당(복사)
let rememberedDirection = currentDirection
// currentDirection의 값 변경, rememberedDirection의 값은 변경되지 않는다.
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
// The current direction is north
print("The remembered direction is \(rememberedDirection)")
// The remembered direction is west
```



## Classes are Reference Types

구조체와 열거형은 값 타입인 반면에 클래스는 참조 타입입니다. 참조 타입은 변수나 상수에 할당하거나 함수의 전달인자로 전달할 때 값을 복사하는 것이 아니라 값의 참조가 전달됩니다. 참조 타입의 특징은 다음과 같습니다. (또 다른 참조 타입으로 클로저가 있습니다.)

- 메모리의 힙 영역에 할당됩니다.
- call by reference 형태를 가집니다.
- 상수를 선언하는 let 키워드는 스택 영역에 값을 수정할 수 없도록 제한하는 키워드입니다. 클래스 인스턴스를 let 키워드로 생성하면 해당 상수는 다른 인스턴스의 참조를 할당받을 수 없게 됩니다. 스택에 저장된 참조 값(인스턴스를 가리키는 값)을 변경할 수 없기 때문입니다. 하지만 인스턴스 내 프로퍼티의 변경은 자유롭습니다. 힙 영역에 있기 때문입니다.

```swift
// 클래스 tenEighty 상수
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
// tenEighty.frameRate에 25.0 할당
tenEighty.frameRate = 25.0
// tenEighty 상수를 alsoTenEighty 상수에 할당(참조 전달)
let alsoTenEighty = tenEighty
// alsoTenEighty.frameRate에 30.0 할당
alsoTenEighty.frameRate = 30.0

// alsoTenEighty의 프로퍼티 값의 변화는 tenEighty의 프로퍼티 값에 영향을 미친다.
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// The frameRate property of tenEighty is now 30.0
```

### Identity Operators

클래스는 참조 타입이기 때문에 여러 상수, 변수가 하나의 클래스 인스턴스를 참조할 수 있습니다. 여러 상수, 변수가 하나의 인스턴스를 참조하고 있는지 확인할 수 있는 ===, !== 연산자가 있습니다. 같은 인스턴스를 참조하고 있으면 true, 아니면 false를 반환합니다.

```swift
// tenEighty가 참조하는 인스턴스와 alsoTenEighty가 참조하는 인스턴스가 같은지 비교
if tenEighty === alsoTenEighty {
  print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// tenEighty and alsoTenEighty refer to the same VideoMode instance.
```

### Pointers

C, C++, Objective-C 언어의 경우 메모리 주소를 참조할 때 포인터를 사용합니다. Swift의 경우 참조 타입을 참조할 때 이런 언어들처럼 포인터와 비슷하지만 직접적인 포인터는 아닙니다. 참조를 생성한다는 구문도 작성하지 않습니다. Swift 표준 라이브러리에서는 직접 포인터와 상호 작용을 할 수 있는 포인터와 버퍼 타입을 제공합니다.
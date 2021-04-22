// MARK: - Opaque Types
/*
 불명확 반환 타입을 가진 함수나 메서드는 반환 값의 타입 정보를 숨깁니다.
 함수의 반환 타입으로 구체적인 타입을 제공하는 대신 반환 값을 자신이 지원하는 프로토콜로 설명합니다.
 타입 정보를 감추는 것은 반환 값의 실제 타입을 private으로 남길 수 있기 때문에 모듈과 그 모듈을 호출하는 코드의 경계선 상에서 유용합니다.
 프로토콜 타입인 값을 반환하는 것과는 달리 불명확 타입은 타입 정체성을 보존합니다. 컴파일러는 타입 정보에 접근할 수 있지만, 모듈 사용자는 그렇지 않습니다.
 */

// MARK: - The Problem That Opaque Types Solve

// Shape 프로토콜
protocol Shape {
    func draw() -> String
}

// Shape 프로토콜을 채택한 Triangle 구조체
struct Triangle: Shape {
    var size: Int
    
    // draw 메서드 구현
    func draw() -> String {
        var result = [String]()
        
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
//print("smallTriangle 결과")
//print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    
    // draw 메서드 구현
    func draw() -> String {
        // \n 단위로 분해
        let lines = shape.draw().split(separator: "\n")
        // 원소 역배열
        return lines.reversed().joined(separator: "\n")
    }
}

// flippedTriangle의 타입은 FlippedShape<Triangle> 이다.
let flippedTriangle = FlippedShape(shape: smallTriangle)
//print("flippedTriangle 결과")
//print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    
    func draw() -> String {
        // 순배열 별, 역배열 별
        top.draw() + "\n" + bottom.draw()
    }
}

// joinedTriangle의 타입은 JoinedShape<Triangle, FlippedShape<Triangle>> 이다.
let joinedTriangle = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//print(joinedTriangle.draw())

// MARK: - Returning an Opaque Type
/*
 불명확 타입은 제네릭 타입이 거꾸로 된 것이라고 생각할 수 있습니다. 제네릭 타입은 함수를 호출하는 코드가 함수의 매개변수 및 반환 값의 타입을 골라내는 방식으로 뽑도록 합니다. 예를 들어, 다음 코드에 있는 함수는 호출하는 쪽에 의존하는 타입을 반환합니다.
 */

// 다음 함수를 호출하는 쪽에서 타입을 지정한다. T는 Comparable을 준수하는 어떤 타입이든 사용할 수 있다.
func max<T>(_ x: T, _ y: T) -> T where T: Comparable {
    return x
}

// 불명확 타입은 함수 구현이 함수 호출 코드에서 골라내는 방식으로 반환 값의 타입을 뽑도록 합니다.

struct Square: Shape {
    var size: Int
    
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = [String](repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}
//let square = Square(size: 3)
//print(square.draw())

// 다음의 함수는 해당 도형의 실제 타입을 노출하지 않으면서 사다리꼴을 반환합니다.
// 불명확 타입의 반환 값은 some 키워드를 사용합니다.
// 이는 Shape 프로토콜을 준수하는 어떤 타입의 값이든 반환합니다.
// 이 예제는 불명확 반환 타입이 제네릭 타입을 거꾸로 한 것과 같다는 것을 강조합니다. 반환 타입이 Shape 프로토콜을 준수하기만 한다면 제네릭 함수를 호출하는 코드가 하듯이, 필요한 어떠한 타입이든 반환할 수 있습니다.
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

// trapezoid의 타입: some Shape
let trapezoid = makeTrapezoid()
// trapezoid의 실제 타입: JoinedShape<Triangle, JoinedShape<Square, FlippedShape<Triangle>>>
//print(trapezoid.draw())

func flip<T: Shape>(_ shape: T) -> some Shape {
    FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

// flip과 join 메서드는 실제 타입이 보이는 것을 막도록 제네릭 도형 연산이 반환하는 실제 타입을 불명확 반환 타입으로 포장합니다.
let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
//print(opaqueJoinedTriangles.draw())

// 불명확 반환 타입을 가진 함수가 여러 곳에서 반환하는 경우 반환 값들은 모두 같은 타입이어야 합니다.
// Function declares an opaque return type, but the return statements in its body do not have matching underlying types
/*
func invaildFlip<T: Shape>(_ shape: T) -> some Shape {
    if shape is Square {
        return shape
    }
    return FlippedShape(shape: shape)
}
 */

// Collection 프로토콜을 준수하는 불명확 타입을 반환
func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    Array<T>(repeating: shape, count: count)
}

// MARK: - Difference Between Opaque Types and Protocol Types

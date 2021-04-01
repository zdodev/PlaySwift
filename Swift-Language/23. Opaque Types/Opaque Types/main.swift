/// The Problem That Opaque Types Solve

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    
    func draw() -> String {
        var result = [String]()
        
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
//print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    
    func draw() -> String {
        // \n 단위로 분해
        let lines = shape.draw().split(separator: "\n")
        // 원소 역배열
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
//print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    
    func draw() -> String {
        // 순배열 별, 역배열 별
        top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangle = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//print(joinedTriangle.draw())

/// Returning an Opaque Type

// opaque type은 함수 구현에서 반환하는 값의 타입을 선택하는 방법으로 이를 함수 호출 코드에서 분리하여 떨여뜨려 놓습니다.
struct Square: Shape {
    var size: Int
    
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = [String](repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

// 삼각형 머리, 네모 몸통, 삼각형 다리
let trapezoid = makeTrapezoid()
print(trapezoid.draw())

import Foundation

struct Calculator {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        if rhs == 0 {
            return lhs
        }
        return add(lhs + 1, rhs - 1)
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        if rhs == 0 {
            return lhs
        }
        return subtract(lhs - 1, rhs - 1)
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        let result = (0..<rhs).reduce(0) { (result, element) in
            result + lhs
        }
        return result
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        lhs / rhs
    }
}


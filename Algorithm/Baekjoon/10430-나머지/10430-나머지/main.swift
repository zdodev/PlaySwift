import Foundation

struct Calculator {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        lhs + rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        lhs * rhs
    }
    
    func remainder(_ lhs: Int, _ rhs: Int) -> Int {
        lhs % rhs
    }
    
    // (A + B) % C
    func performFirstExpression(_ first: Int, _ second: Int, _ third: Int) -> Int {
        let additionAB = add(first, second)
        let result = remainder(additionAB, third)
        return result
    }
    
    // ((A % C) + (B % C)) % C
    func performSecondExpression(_ first: Int, _ second: Int, _ third: Int) -> Int {
        let remainderAC = remainder(first, third)
        let remainderBC = remainder(second, third)
        let addition = add(remainderAC, remainderBC)
        let result = remainder(addition, third)
        return result
    }
    
    // (A x B) % C
    func performThirdExpression(_ first: Int, _ second: Int, _ third: Int) -> Int {
        let muliplicationAB = multiply(first, second)
        let result = remainder(muliplicationAB, third)
        return result
    }
    
    // ((A % C) x (B % C)) % C
    func performFourthExpression(_ first: Int, _ second: Int, _ third: Int) -> Int {
        let remainderAC = remainder(first, third)
        let remainderBC = remainder(second, third)
        let multiplication = multiply(remainderAC, remainderBC)
        let result = remainder(multiplication, third)
        return result
    }
}

struct Solution {
    private func readIntegers() -> [Int] {
        let input = readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
        return input
    }
    
    func result() {
        let input = readIntegers()
        let first = input[0]
        let second = input[1]
        let third = input[2]
        
        let calculator = Calculator()
        
        let firstExpressionResult = calculator.performFirstExpression(first, second, third)
        print(firstExpressionResult)
        
//        let secondExpressionResult = calculator.performSecondExpression(first, second, third)
        let secondExpressionResult = calculator.performFirstExpression(first, second, third)
        print(secondExpressionResult)
        
        let thridExpressionResult = calculator.performThirdExpression(first, second, third)
        print(thridExpressionResult)
        
//        let fourthExpressionResult = calculator.performFourthExpression(first, second, third)
        let fourthExpressionResult = calculator.performThirdExpression(first, second, third)
        print(fourthExpressionResult)
    }
}

Solution().result()

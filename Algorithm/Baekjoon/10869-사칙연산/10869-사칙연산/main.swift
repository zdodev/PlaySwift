import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        let input = readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
        return input
    }
    
    private func add(operand: [Int]) -> Int {
        operand[0] + operand[1]
    }
    
    private func subtract(operand: [Int]) -> Int {
        operand[0] - operand[1]
    }
    
    private func multiply(operand: [Int]) -> Int {
        operand[0] * operand[1]
    }
    
    private func divide(operand: [Int]) -> Int {
        operand[0] / operand[1]
    }
    
    private func remainder(operand: [Int]) -> Int {
        operand[0] % operand[1]
    }
    
    func result() {
        let integers = readIntegers()
        
        var operationResults = [Int]()
        operationResults.append(add(operand: integers))
        operationResults.append(subtract(operand: integers))
        operationResults.append(multiply(operand: integers))
        operationResults.append(divide(operand: integers))
        operationResults.append(remainder(operand: integers))
        
        _ = operationResults.map { element in
            print(element)
        }
    }
}

Solution().result()

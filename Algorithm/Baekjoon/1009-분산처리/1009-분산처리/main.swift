import Foundation

struct Solution {
    let remainderValue = [
        [0],
        [1],
        [2, 4, 8, 6],
        [3, 9, 7, 1],
        [4, 6],
        [5],
        [6],
        [7, 9, 3, 1],
        [8, 4, 2, 6],
        [9, 1]
    ]
    
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func makeUnitDigitNumber(_ number: Int) -> Int {
        number % 10
    }
    
    private func divideExponentOfLength(_ length: Int, _ number: Int) -> Int {
        number % length
    }
    
    func solution(_ input: [Int]) -> Int {
        let unitDigit = makeUnitDigitNumber(input[0])
        
        if unitDigit == 0 {
            return 10
        }
        
        var remainder = divideExponentOfLength(remainderValue[unitDigit].count, input[1])
        
        if remainderValue[unitDigit].count > 1 {
            if remainder == 0 {
                remainder = remainderValue[unitDigit].count - 1
            } else {
                remainder -= 1
            }
        }
        
        return remainderValue[unitDigit][remainder]
    }
    
    func result() {
        let count = readInteger()
        
        for _ in 1...count {
            let input = readIntegers()
            let expectedValue = solution(input)
            print(expectedValue)
        }
    }
}

Solution().result()

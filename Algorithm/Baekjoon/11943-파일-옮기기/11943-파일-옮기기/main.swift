import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let inputA = readIntegers()
        let inputB = readIntegers()
        
        let sumOfAAndD = inputA[0] + inputB[1]
        let sumOfBAndC = inputA[1] + inputB[0]
        
        if sumOfAAndD > sumOfBAndC {
            print(sumOfBAndC)
        } else {
            print(sumOfAAndD)
        }
    }
}

Solution().solution()

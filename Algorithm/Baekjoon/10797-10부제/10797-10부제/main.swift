import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let day = readInteger()
        let carNumbers = readIntegers()
        
        let count = carNumbers.filter { element in
            element == day
        }.count
        
        print(count)
    }
}

Solution().solution()

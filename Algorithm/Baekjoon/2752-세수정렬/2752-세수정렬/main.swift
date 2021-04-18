import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = input.sorted()
        print("\(output[0]) \(output[1]) \(output[2])")
    }
}

Solution().solution()

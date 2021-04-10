import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        for _ in 0..<input[0] {
            _ = readLine()
        }
        print("비와이")
    }
}

Solution().solution()

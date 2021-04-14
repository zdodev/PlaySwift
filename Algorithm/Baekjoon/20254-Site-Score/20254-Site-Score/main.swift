import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = input[0] * 56 + input[1] * 24 + input[2] * 14 + input[3] * 6
        print(output)
    }
}

Solution().solution()

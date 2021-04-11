import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = (input[0] + input[1]) * (input[0] - input[1])
        print(output)
    }
}

Solution().solution()

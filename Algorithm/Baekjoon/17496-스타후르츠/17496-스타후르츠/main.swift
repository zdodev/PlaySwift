import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }

    func solution() {
        let input = readIntegers()
        let output = (((input[0] - 1) / input[1]) * input[2]) * input[3]
        print(output)
    }
}

Solution().solution()

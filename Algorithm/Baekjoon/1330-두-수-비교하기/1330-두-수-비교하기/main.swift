import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func compareAandB(_ a: Int, b: Int) -> String {
        if a < b {
            return "<"
        } else if a > b {
            return ">"
        } else {
            return "=="
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = compareAandB(input[0], b: input[1])
        print(output)
    }
}

Solution().solution()

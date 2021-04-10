import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    private func findSeat(_ matrix: [Int]) -> [Int] {
        let n = matrix[2] / matrix[1]
        let m = matrix[2] % matrix[1]
        return [n, m]
    }
    
    func solution() {
        let input = readIntegers()
        let output = findSeat(input)
        print("\(output[0]) \(output[1])")
    }
}

Solution().solution()

import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        var output = [Int]()
        output.append(input[1] - input[0])
        output.append(input[1])
        print("\(output[0]) \(output[1])")
    }
}

Solution().solution()

import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        
        let bigger = (input[0] + input[1]) / 2
        let lesser = (input[0] - input[1]) / 2
        if lesser >= 0 && (bigger + lesser == input[0]) && (bigger - lesser) == input[1] {
            print("\(bigger) \(lesser)")
        } else {
            print(-1)
        }
    }
}

Solution().solution()

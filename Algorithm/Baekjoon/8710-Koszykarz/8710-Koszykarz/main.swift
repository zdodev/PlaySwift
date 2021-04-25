import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let k = input[0]
        let w = input[1]
        let m = input[2]
        
        let heightDifference = w - k
        
        if heightDifference % m == 0 {
            print(heightDifference / m)
        } else {
            print(heightDifference / m + 1)
        }
    }
}

Solution().solution()

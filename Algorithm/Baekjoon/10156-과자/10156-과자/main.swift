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
        let n = input[1]
        let m = input[2]
        let total = k * n
        
        if m > total {
            print(0)
        } else {
            print(total - m)
        }
    }
}

Solution().solution()

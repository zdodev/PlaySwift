import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let x = input[0]
        let k = input[1]
        
        if k * 7 <= x {
            print(k * 7000)
        } else if Double(k) * 3.5 <= Double(x) {
            print(k * 3500)
        } else if Double(k) * 1.75 <= Double(x) {
            print(k * 1750)
        } else {
            print(0)
        }
    }
}

Solution().solution()

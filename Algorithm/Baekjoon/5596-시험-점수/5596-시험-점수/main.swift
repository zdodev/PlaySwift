import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").compactMap {
            Int($0)
        }
    }
    
    func solution() {
        let a = readIntegers()
        let b = readIntegers()
        
        let totalA = a.reduce(0) { (result, element) in
            result + element
        }
        let totalB = b.reduce(0) { (result, element) in
            result + element
        }
        
        if totalA > totalB {
            print(totalA)
        } else {
            print(totalB)
        }
    }
}

Solution().solution()

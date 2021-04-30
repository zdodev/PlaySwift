import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let tea = readInteger()
        let challengers = readIntegers()
        var count = 0
        
        for challenger in challengers {
            if challenger == tea {
                count += 1
            }
        }
        
        print(count)
    }
}

Solution().solution()


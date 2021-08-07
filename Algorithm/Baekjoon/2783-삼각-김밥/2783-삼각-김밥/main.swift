import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readDoubles() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        var total = [Double]()
        
        let first = readDoubles()
        let count = readInteger()
        
        total.append(1_000.0 / first[1] * first[0])
        
        for _ in 1...count {
            let input = readDoubles()
            total.append(1_000.0 / input[1] * input[0])
        }
        
        var min = total.min()!
        min = round(min * 100) / 100
        
        print(min)
    }
}

Solution().solution()

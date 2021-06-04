struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let _ = readInteger()
        let times = readIntegers()
        
        let y = times.map {
            ($0 / 30 + 1) * 10
        }.reduce(0) { result, element in
            result + element
        }
        
        let m = times.map {
            ($0 / 60 + 1) * 15
        }.reduce(0) { result, element in
            result + element
        }
        
        if y < m {
            print("Y \(y)")
        } else if y > m {
            print("M \(m)")
        } else {
            print("Y M \(y)")
        }
    }
}

Solution().solution()

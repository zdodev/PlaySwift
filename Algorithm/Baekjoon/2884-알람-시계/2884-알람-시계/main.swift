struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        var hour = input[0]
        var minute = input[1]
        
        if minute >= 45 {
            print("\(hour) \(minute - 45)")
        } else {
            if hour <= 0 {
                print("23 \(minute + 15)")
            } else {
                print("\(hour - 1) \(minute + 15)")
            }
        }
    }
}

Solution().solution()

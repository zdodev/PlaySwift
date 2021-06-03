struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let kPa = 5 * input - 400
        print(kPa)
        
        if kPa > 100 {
            print(-1)
        } else if kPa < 100 {
            print(1)
        } else {
            print(0)
        }
    }
}

Solution().solution()

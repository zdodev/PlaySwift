struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let testcase = readInteger()

        for _ in 1...testcase {
            _ = readLine()
            let count = readInteger()
            
            var remainder = 0
            for _ in 1...count {
                let candy = readInteger()
                remainder = (remainder + candy) % count
            }
            
            if remainder == 0 {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
}

Solution().solution()

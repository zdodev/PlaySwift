struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let t = readInteger()
        
        for _ in 1...t {
            print(countRemainderIsZero(readInteger()))
        }
    }
    
    private func countRemainderIsZero(_ number: Int) -> Int {
        if number == 1 {
            return 0
        }
        
        var countZero = 0
    
        for divisor in 2...number {
            var num = number
            while num % divisor == 0 {
                countZero += 1
                num /= divisor
            }
        }
        
        return countZero
    }
}

Solution().solution()

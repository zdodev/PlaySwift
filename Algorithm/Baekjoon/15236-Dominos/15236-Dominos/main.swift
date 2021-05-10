struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        var sum = 0
        for a in 0...input {
            for b in a...input {
                sum += a + b
            }
        }
        
        print(sum)
    }
}

Solution().solution()

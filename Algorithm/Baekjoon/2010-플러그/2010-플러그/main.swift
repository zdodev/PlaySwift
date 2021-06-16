struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        var sum = 0
        for _ in 1...input {
            sum += readInteger()
        }
        print(sum - (input - 1))
    }
}

Solution().solution()

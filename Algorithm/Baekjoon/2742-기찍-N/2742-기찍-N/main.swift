struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input = readInteger()
        
        while input > 0 {
            print(input)
            input -= 1
        }
    }
}

Solution().solution()

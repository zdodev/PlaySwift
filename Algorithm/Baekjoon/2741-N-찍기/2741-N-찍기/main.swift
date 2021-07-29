struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for index in 1...input {
            print(index)
        }
    }
}

Solution().solution()

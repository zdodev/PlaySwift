struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        for index in 1...9 {
            print("\(input) * \(index) = \(input * index)")
        }
    }
}

Solution().solution()

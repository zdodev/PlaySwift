struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let output = input * input - input
        print(output)
    }
}

Solution().solution()

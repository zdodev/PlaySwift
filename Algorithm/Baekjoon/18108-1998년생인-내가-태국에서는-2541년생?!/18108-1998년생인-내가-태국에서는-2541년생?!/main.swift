struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let output = input - 543
        print(output)
    }
}

Solution().solution()

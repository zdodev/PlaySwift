struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let d = readInteger()
        let r = readInteger()
        
        let result = Double(d) * 2 + 2 * 3.141592 * Double(r)
        print(result)
    }
}

Solution().solution()

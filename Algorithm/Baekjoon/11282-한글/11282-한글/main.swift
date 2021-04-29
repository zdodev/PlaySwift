struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let characterBase = 44031 + input
        print(UnicodeScalar(characterBase)!)
    }
}

Solution().solution()

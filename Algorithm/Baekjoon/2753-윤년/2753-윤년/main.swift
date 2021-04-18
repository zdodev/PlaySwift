struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        var output = 0
        
        if (input % 4 == 0 && input % 100 != 0) || (input % 400 == 0) {
            output = 1
        }
        
        print(output)
    }
}

Solution().solution()

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func calculate(_ number: Int) -> Int {
        var constant = 2
        var piece = 0
        
        for index in 0..<number {
            if (index % 2 == 1) && index >= 3 {
                constant += 1
            }
            piece += constant
        }
        
        return piece
    }
    
    func solution() {
        let input = readInteger()
        let output = calculate(input)
        print(output)
    }
}

Solution().solution()

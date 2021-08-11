struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        var temp = 1
        
        for _ in 1...input {
            temp *= 2
        }
        
        temp += 1
        
        print(temp * temp)
    }
}

Solution().solution()

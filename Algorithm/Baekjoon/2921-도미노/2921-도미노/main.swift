struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        var sum = 0
        
        for index1 in 0...input {
            for index2 in index1...input {
                sum += index1 + index2
            }
        }
        
        print(sum)
    }
}

Solution().solution()

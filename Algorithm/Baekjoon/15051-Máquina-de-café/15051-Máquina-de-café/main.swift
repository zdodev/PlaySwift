struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input = [Int]()
        for _ in 1...3 {
            input.append(readInteger())
        }
        
        var result = [Int]()
        result.append(input[1] * 2 + input[2] * 4)
        result.append(input[0] * 2 + input[2] * 2)
        result.append(input[0] * 4 + input[1] * 2)

        print(result.min()!)
    }
}

Solution().solution()

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input = [Int]()
        for _ in 1...4 {
            input.append(readInteger())
        }
        
        if (input[0] == 8 || input[0] == 9) && (input[3] == 8 || input[3] == 9) && (input[1] == input[2]) {
            print("ignore")
        } else {
            print("answer")
        }
    }
}

Solution().solution()

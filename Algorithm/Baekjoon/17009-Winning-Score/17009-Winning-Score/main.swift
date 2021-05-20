struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input1 = [Int]()
        for _ in 1...3 {
            input1.append(readInteger())
        }
        var input2 = [Int]()
        for _ in 1...3 {
            input2.append(readInteger())
        }
        
        var result1 = 0
        result1 = input1[0] * 3 + input1[1] * 2 + input1[2]
        var result2 = 0
        result2 = input2[0] * 3 + input2[1] * 2 + input2[2]
        
        if result1 > result2 {
            print("A")
        } else if result1 < result2 {
            print("B")
        } else {
            print("T")
        }
    }
}

Solution().solution()

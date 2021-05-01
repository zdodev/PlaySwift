struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var input1 = [Int]()
        for _ in 1...4 {
            input1.append(readInteger())
        }
        var sum = input1.reduce(0) { result, element in
            result + element
        }
        sum -= input1.min()!
        
        var input2 = [Int]()
        for _ in 1...2 {
            input2.append(readInteger())
        }
        sum += input2.max()!
        
        print(sum)
    }
}

Solution().solution()

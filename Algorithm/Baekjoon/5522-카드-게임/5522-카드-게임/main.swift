struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func sum(_ numbers: [Int]) -> Int {
        numbers.reduce(0) { (result, element) in
            result + element
        }
    }
    
    func solution() {
        var input = [Int]()
        
        for _ in 0..<5 {
            input.append(readInteger())
        }
        
        print(sum(input))
    }
}

Solution().solution()

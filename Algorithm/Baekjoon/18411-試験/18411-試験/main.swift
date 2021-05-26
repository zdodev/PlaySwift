struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var input = readIntegers()
        
        let first = input.max()!
        let removingIndex = input.firstIndex(of: first)
        input.remove(at: removingIndex!)
        let second = input.max()!
        print(first + second)
    }
}

Solution().solution()

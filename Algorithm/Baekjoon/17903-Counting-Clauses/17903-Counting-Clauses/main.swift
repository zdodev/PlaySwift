struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let result = input[0] >= 8 ? "satisfactory" : "unsatisfactory"
        print(result)
    }
}

Solution().solution()

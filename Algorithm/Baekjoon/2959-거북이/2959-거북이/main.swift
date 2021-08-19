struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let sortedInput = input.sorted()
        print(sortedInput[0] * sortedInput[2])
    }
}

Solution().solution()

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func sort(_ value: [Int]) -> [Int] {
        value.sorted()
    }
    
    func solution() {
        let input = readIntegers()
        let result = sort(input)
        let secondLargestInteger = result[1]
        print(secondLargestInteger)
    }
}

Solution().solution()

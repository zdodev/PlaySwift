struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func shortestDistance(_ value: [Int]) -> Int {
        [
            value[0],
            value[1],
            value[2] - value[0],
            value[3] - value[1],
        ].min()!
    }
    
    func solution() {
        let input = readIntegers()
        let result = shortestDistance(input)
        print(result)
    }
}

Solution().solution()

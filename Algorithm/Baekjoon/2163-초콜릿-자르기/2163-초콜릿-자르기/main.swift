struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let n = input[0]
        let m = input[1]
        let result = (n - 1) + n * (m - 1)
        print(result)
    }
}

Solution().solution()

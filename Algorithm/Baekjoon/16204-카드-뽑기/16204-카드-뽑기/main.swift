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
        let k = input[2]
        
        let minX = min(m, k)
        let minY = min(n - m, n - k)
        print(minX + minY)
    }
}

Solution().solution()

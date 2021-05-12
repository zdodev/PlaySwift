struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let area = input[0] * input[1]
        
        print(area / 2)
    }
}

Solution().solution()

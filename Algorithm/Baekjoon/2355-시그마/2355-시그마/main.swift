struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let a = input[0]
        let b = input[1]
        
        var result = 0
        
        if a <= b {
            result = (b - a + 1) * (b + a) / 2
        } else {
            result = (a - b + 1) * (b + a) / 2
        }
        
        print(result)
    }
}

Solution().solution()

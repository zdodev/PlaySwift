struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var input = readIntegers()
        
        while input[0] != 0 {
            var branch = 1
            for index in 0..<input[0] {
                branch = branch * input[index * 2 + 1] - input[index * 2 + 2]
            }
            print(branch)
            input = readIntegers()
        }
    }
}

Solution().solution()

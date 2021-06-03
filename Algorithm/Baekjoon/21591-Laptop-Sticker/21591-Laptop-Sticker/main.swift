struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        if input[0] - input[2] >= 2 && input[1] - input[3] >= 2 {
            print(1)
        } else {
            print(0)
        }
    }
}

Solution().solution()

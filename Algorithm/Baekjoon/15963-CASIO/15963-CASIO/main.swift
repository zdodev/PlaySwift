struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        if input[0] == input[1] {
            print(1)
        } else {
            print(0)
        }
    }
}

Solution().solution()

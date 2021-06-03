struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        if input[0] > input[1] {
            print(input[1])
        } else if input[0] < input[1] {
            print(input[0] + 1)
        } else {
            print(input[0])
        }
    }
}

Solution().solution()

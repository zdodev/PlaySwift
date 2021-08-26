struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers().sorted()
        
        if input[0] - input[1] == input[1] - input[2] {
            print(input[2] + input[1] - input[0])
        }
        
        if input[0] - input[1] > input[1] - input[2] {
            print(input[0] + (input[2] - input[1]))
        } else {
            print(input[2] - (input[1] - input[0]))
        }
    }
}

Solution().solution()

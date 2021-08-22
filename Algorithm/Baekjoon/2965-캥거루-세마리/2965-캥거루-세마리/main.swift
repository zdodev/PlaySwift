struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        let difference1 = input[1] - input[0]
        let difference2 = input[2] - input[1]
        
        if difference1 > difference2 {
            print(difference1 - 1)
        } else {
            print(difference2 - 1)
        }
    }
}

Solution().solution()

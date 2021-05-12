struct Solution {
    private func readIntegers() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let result1 = input[0] * input[1] / input[2]
        let result2 = input[0] / input[1] * input[2]
        
        if result1 > result2 {
            print(Int(result1))
        } else {
            print(Int(result2))
        }
    }
}

Solution().solution()
